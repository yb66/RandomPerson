# encoding: UTF-8

# A library for generating random names
module RandomPerson

  #require all the scaffolding
  
  require 'set'
  require 'date'
  
  require_relative './randomperson/version.rb'
  require_relative './randomperson/ext/array.rb'
  require_relative './randomperson/ext/date.rb'
  require_relative './randomperson/ext/enumerable.rb'
  require_relative './randomperson/ext/hash.rb'
  require_relative './randomperson/ext/kernel.rb'
  require_relative './randomperson/ext/set.rb'
  
  require_relative './randomperson/demographic.rb'
  require_relative './randomperson/generator.rb'
  require_relative './randomperson/name.rb'
  require_relative './randomperson/person.rb'
  #require_relative './randomperson/ratio.rb'

  class DemoHash < Hash
    def loaded_classes
      if @loaded_classes.nil?
        @loaded_classes = Hash.new
        self.each do |key,demographic|
          @loaded_classes[key] = demographic.loaded_classes
        end
      end
      @loaded_classes
    end

    alias :old_store :store
    alias :"[]=" :store

    def store( key, value )
      @loaded_classes ||= Hash.new
      @loaded_classes[key] = value
      old_store key, value
    end
  end

  class Facade

    # @return [Hash{String => RandomPerson::Demographic}]
    def demographics
      @demos ||= DemoHash.new
    end

    # @return [Hash]
    def loaded_classes
      demographics.loaded_classes
    end

    #class instance variable to keep track of generators
    def generators
      @generators ||= {}
    end


    # A little factory
    # @param [String,Symbol,Integer] name The key for retrieving the demographic.
    # @param [Hash] opts Option hash to pass to Demographic.new
    # @see Demographic#initialize
    def demographic( name=nil, opts={} )
      if name.kind_of? Hash
        opts = name
        name = nil
      end
      name = demographics.length.to_s if name.nil?
      demo = Demographic.new name, opts
      demographics[name] = demo
      generators.delete name # just in case it already exists
      demo
    end
    
    
    # start afresh
    def clear
      @demos = nil
      @generators = nil
      @person = nil
      @last_demo_name = nil
    end
    
    alias :reset :clear
    attr_accessor :last_demo_name


    # The last person generated.
    # If a demographic name is given that is different to the last then a new person is generated. If no name is given then the last is used.
    # @param [String,Symbol,Integer] demo_name The key for retrieving the demographic.
    # @param [#call] block Error handler for when a key is given that does not exist.
    # @return [RandomPerson::Person]
    def person( demo_name=nil, &block )
      person, last_demo_name = 
        if demo_name.nil? 
          if @person.nil?
            # either generate a new one
            gen_new( demo_name, &block ) # gen a new person and get back demo name
          else
            #  get last one
            [@person, @last_demo_name]
          end
        else # demo name given
          if demographics.has_key? demo_name
            if demo_name == @last_demo_name
              [@person, @last_demo_name]
            else
              gen_new( demo_name, &block )
            end
          else
            gen_new( demo_name, &block )
          end
        end
        return nil if person.nil?
        @person, @last_demo_name = [person, last_demo_name]

      @person
    end

    
    # Generate a new demographic
    # @param [#to_s] demo_name A name for the demographic.
    # @param [#call] block
    # @return [RandomPerson::Demographic]
    def generate( demo_name=nil, &block )
      ds = gen_new( demo_name, &block )
      ds.nil? ? nil : ds.first
    end


    # For when a demo isn't given but you still need one.
    # @return [String, RandomPerson::Demographic]
    def generate_demo
      Demographic.load
      yesses = %w{prefix suffix female -male last}.map {|word|
        Demographic.available_name_files.classify_true(word).to_a.sample
      }
      demo = self.demographic
      demo.require_and_add yesses
      [demo.name, demo]
    end


    # The default default error block :)
    DEFAULT_gen_new_BLOCK = ->(error) {
      warn error.message
    }


    # This holds the default error block
    def self.default_error_block
      @default_gen_new_error_block ||= DEFAULT_gen_new_BLOCK
    end

    # Set the default error block
    # @param [#call] block
    def self.default_error_block=( block )
      @default_gen_new_error_block = block
    end


    # If not given a demographic's name then the *last demographic defined* will be used. If there is no demographic already defined a new one will be created. If a key is given but does not exist then the supplied block will be called. If no block is given an exception will be raised.
    # @param [String,Symbol,Integer] demo_name The key for retrieving the demographic.
    # @param [#call] block Default for when a key is given that does not exist.
    def gen_new( demo_name=nil, &block )
      block = self.class.default_error_block if block.nil?
      demo_name, demo = if demo_name.nil?
        if demographics.nil? || demographics.empty?
          generate_demo
        else
          demographics.to_a.last # this produces a 2 dimensional array
        end
      else
        if ds = demographics.assoc(demo_name)
          ds
        else
          fail "That demographic does not exist!" 
        end
      end

      @last_demo_name = demo_name
      unless generators.has_key? demo_name
        generators[demo_name] = Generator.make_generator( demo )
      end

      @person = generators[demo_name].call 
        
      [@person, demo_name]
    rescue => error
      block.call(error)
    end

  end # class


end

def RandomPerson
  RandomPerson::Facade.new
end

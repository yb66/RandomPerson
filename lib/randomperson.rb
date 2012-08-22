# encoding: UTF-8


module RandomPerson

  #require all the scaffolding
  
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


  class Facade

    def demographics
      @demos ||= {}
    end

    #class instance variable to keep track of generators
    def generators
      @generators ||= {}
    end


    # little factory
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
    # @param [String] demo_name The key of the demographic to use, e.g "American Ladies".
    def person( demo_name=nil )
      person, last_demo_name = 
        if demo_name.nil? 

          if @person.nil?

            # either generate a new one
            gen_new( demo_name ) # gen a new person and get back demo name
          else 

            #  get last one
            [@person, @last_demo_name]
          end
        else # demo name given

          if demographics.has_key? demo_name

            if demo_name == @last_demo_name

              [@person, @last_demo_name]
            else

              gen_new( demo_name )
            end
          else 

            if demographics.nil? || demographics.empty?

              raise "No demographics have been selected yet! Try something like r.demographic.add_Spanish..." 
            else # that demo name doesn't exist...

              [nil, @last_demo_name] # so preserve the last good demo name
            end
          end
        end
        return nil if person.nil?
        @person, @last_demo_name = [person, last_demo_name]

      @person
    end

    
    # generate a new person
    # either with the last demographic loaded, or a specific one by passing the name.
    def generate( demo_name=nil )
      ds = gen_new( demo_name )
      ds.nil? ? nil : ds.first
    end


    # If not given a demographic's name then the *last demographic defined* will be used.
    def gen_new( demo_name=nil )
      if demographics.nil? || demographics.empty?
        raise "No demographics have been selected yet! Try something like r.demographic.add_Spanish..." 
      end
      demo_name, demo = if demo_name.nil?
        demographics.to_a.last # this produces a 2 dimensional array
      else
        demographics.assoc(demo_name)
      end
      
      if demo_name
        @last_demo_name = demo_name
        unless generators.has_key? demo.name
          generators[demo.name] = Generator.make_generator( demo )
        end
  
        @person = generators[@last_demo_name].call 
          
        [@person, @last_demo_name]
      else
        nil
      end
    end

  end # class


end

def RandomPerson
  RandomPerson::Facade.new
end

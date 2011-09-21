# encoding: UTF-8


module RandomPerson

  #require all the scaffolding
  
  require 'set'
  require 'date'
  
  require_relative './randomperson/version.rb'
  require_relative './randomperson/ext/Array.rb'
  require_relative './randomperson/ext/Date.rb'
  require_relative './randomperson/ext/Enumerable.rb'
  require_relative './randomperson/ext/Hash.rb'
  require_relative './randomperson/ext/Kernel.rb'
  require_relative './randomperson/ext/Set.rb'
  
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

    def demographic( name=nil, opts={} )
      if name.kind_of? Hash
        opts = name
        name = nil
      end
      name = demographics.length.to_s if name.nil?
      demo = Demographic.new name, opts
      demographics[name] = demo 
      demo
    end

    # The last person generated.
    # If a demographic name is given that is different to the last then a new person is generated. If no name is given then the last is used.
    def person( demo_name=nil )
      @person, @last_demo_name = 
        if @last_demo_name.nil? || (demo_name && demo_name != @last_demo_name )
          gen_new( demo_name ) # gen a new person and get back demo name
        else
          [@person, @last_demo_name] 
        end
      @person
    end

    # If not given a demograpic's name then the *last demographic defined* will be used.
    def gen_new( demo_name=nil )
      demo_name, demo = demographics.assoc(demo_name) || demographics.to_a.last # this produces a 2 dimensional array

      unless generators.has_key? demo.name
        generators[demo.name] = Generator.make_generator( demo )
      end

      @person = generators[demo_name].call 
        
      [@person, demo.name]
    end

  end # class


end

def RandomPerson
  RandomPerson::Facade.new
end

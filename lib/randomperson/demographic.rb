# encoding: UTF-8

require_relative "./loader.rb"
require_relative "./ext/set.rb"



module RandomPerson

  class Demographic
    include Loader
    
    # the name of this demographic
    attr_accessor :name


    def loaded_classes
      @loaded_classes ||= {}
    end


    attr_accessor :malefirst, :femalefirst, :last, :gender_ratio, :age_lower, :age_upper, :prefix, :suffix #,:age_ratio


    alias :lastname :last
    alias :male_first :malefirst
    alias :female_first :femalefirst


    def self.available_name_files
      @available_name_files ||= Set.new
    end


    # Initialize the class with the parameters for the population you want.
    # @example 
    #   demographic = RandomPerson::Demographic.new( {gender_ratio: [3,5] , age_lower:16, age_upper:35 } )
    def initialize( name=nil, opts={} )
      if name.kind_of? Hash
        opts = name
        name = nil
      end
      @name = name
      @gender_ratio = opts[:gender_ratio] || [1,1] #default
      @age_lower = opts[:age_lower] || 0
      @age_upper = opts[:age_upper] || 115
      @loaded_classes ||= {}

      self.class.load
    end

    # puts the demo files into the class instance var
    def self.load
      self.available_name_files.merge self.load_names if self.available_name_files.empty?
    end


    # @param [String] name
    # @return [Array<String>]
    def get_words( name )
      words = name.to_s.split( "_" )
      words.shift #get rid of the "add"
      words
    end


    # Get the negations prepended with "not", then lop it off"
    # @param [Array<String>] words
    # @return [Array<String>]
    def get_nots( words )
      words.select{ |w| w =~ /^not/ }.map {|s| s[3..-1] }
    end


    # Get the positives.
    # @param [Array<String>] words
    # @return [Array<String>]
    def get_yesses( words )
      #get just the positives
      #check the beginning of each word has an uc letter
      words.reject{|w| 
        w =~ /^not/ 
      }.select{|w| 
        w =~ /^\p{Upper}/
      }
    end


    def require_and_add( yesses ) 
      yesses.each {|file_name|
        require file_name
        klass = Kernel.const_get( Demographic.translate file_name )
        addklass klass
      }
    end
      
    # tribe, gender, position
    def method_missing( name, *args )
      return super( name, *args ) unless name.to_s =~ /^add/
      
      words = get_words( name )
      
      nots = get_nots( words ).map{|word|
        Demographic.available_name_files.classify_true(word)
      }.fold(:&)
      
      yesses = get_yesses( words ).map{|word| 
          Demographic.available_name_files.classify_true(word)
      }.fold(:&)
      
      require_and_add yesses

      self # just because
    end


    # Be nice.
    # @api private
    def respond_to_missing?(name, include_private = false)
      self.class.method_defined?(name) or
      name.to_s =~ /^add/ or
      super
    end
    
    
  end
  
end

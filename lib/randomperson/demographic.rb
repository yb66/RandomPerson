# encoding: UTF-8

require_relative "./Loader.rb"

module RandomPerson

  class Demographic
    include Loader
    
    require 'set'
    
    # the name of this demographic
    attr_accessor :name

    attr_accessor :malefirst, :femalefirst, :last, :gender_ratio, :age_lower, :age_upper, :prefix, :suffix #,:age_ratio
    
    def self.available_classes
      @available_classes ||= Set.new
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
      

      Demographic.available_classes.merge Demographic.load_names
    end
    

    
    # tribe, gender, position
    def method_missing( name, *args )
      return super( name, *args ) unless name.to_s =~ /^add/  
      words = name.to_s.split( "_" )
      words.shift #get rid of the "add"
      
      #get the negations prepended with "not", then lop it off"
      nots = words.select{ |w| w =~ /^not/ }.map {|s| s[3..-1] }
      #get just the positives
      words.reject! {|w| w =~ /^not/ }
      
      #check the beginning of each word has an uc letter
      words.select! {|w| w =~ /^\p{Upper}/ }
      
      #get a set of nots
      nots = nots.map{|word| Demographic.available_classes.classify_true(word)}.fold(:&)
      #get a set of wanteds
      yesses = words.map{|word| Demographic.available_classes.classify_true(word)}.fold(:&)
      
      yesses = yesses - nots unless nots.nil? #remove nots from wanteds
      
      Demographic.prefix_em( yesses.map{|(file_name)| Demographic.requiring( file_name ) } ).each do |klass|
        addklass klass
      end
      
      true # just because
    end
    

    
    #set all the nameclasses for this instance to nil
    def reset_names
      @suffix = nil
      @prefix = nil
      @last = nil
      @malefirst = nil
      @femalefirst = nil
    end
    
    #set all parameters and nameclasses for this instance to nil
    def reset_all
      reset_names
      reset_parameters
    end
    
    #set the age and gender parameters for this instance to nil
    def reset_parameters
      @age_upper = nil
      @age_lower = nil
      @gender_ratio  = nil
    end
    
#       while n > 0
#         r = rand(rat.last.last)
#         puts "n: #{n} r: #{r}"
#         i = rat.index_in_range( r )
#         puts "i: #{i}"
#         
#         person = @demographics[i].call
#         puts person.inspect
#         @people << person 
#         n -= 1
#       end
    
    
  end
  
end

#!/usr/bin/env ruby -wKU

require 'set'
module RandomPerson

  class Choice
    
    attr_accessor :malefirst, :femalefirst, :last, :gender_ratio, :age_lower, :age_upper, :dob, :prefix, :suffix #,:age_ratio
    
    def available_classes
      @@available_classes
    end
    
    @@available_classes = Set.new
    
    def initialize( h={} )
      @gender_ratio = h[:gender_ratio] || [1,1] #default
      @age_lower = h[:age_lower] || 0
      @age_upper = h[:age_upper] || 100

      load_names
    end
    
    def load_names( patterns=['*.rb'] )
      # puts "patterns: #{patterns}"
      # available_files = [ ]
      lib_dir = File.dirname(__FILE__)
      
      patterns.each do |pat|
        full_pattern = File.join( lib_dir, 'NameFiles', pat )
        # puts full_pattern
        Dir.glob( full_pattern ).each do |file|    
#           require file
          @@available_classes << file
        end
      end
    end
    
    # tribe, gender, position
    #English_males
    def method_missing( name, *args )
      return super( name, *args ) unless name.to_s =~ /^add/  
      words = name.to_s.split( "_" )
      words.shift #get rid of the "add"
      #TODO: check the beginning of each word has an uc letter
      cs = words.map { |word| @@available_classes.classify_true(word) }.fold(:&)
      
      cs.each do |c|
        require c
        fn = File.basename( c, File.extname( c ) ) #remove the extension
        addklass( fn, %w{ Male First } )
        addklass( fn, %w{ Female First } )
        addklass( fn, %w{ Last } )
        addklass( fn, %w{ Prefix } )
        addklass( fn, %w{ Suffix } )
      end
    end
    
    
    def addklass( fn, ps )
      if ps.map { |p| fn =~ /#{p}/ }.all?
        instance_variable_set( "@#{ps.join.downcase}", qualified_const_get(fn).new )
      end
    end

    
#       while n > 0
#         r = rand(rat.last.last)
#         puts "n: #{n} r: #{r}"
#         i = rat.index_in_range( r )
#         puts "i: #{i}"
#         
#         person = @choices[i].call
#         puts person.inspect
#         @people << person 
#         n -= 1
#       end
    
    
  end
  
end

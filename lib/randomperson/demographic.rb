module RandomPerson

  class Demographic
    require 'set'
    
    # the name of this demographic
    attr_accessor :name

    attr_accessor :malefirst, :femalefirst, :last, :gender_ratio, :age_lower, :age_upper, :prefix, :suffix #,:age_ratio
    
    def available_classes
      @@available_classes #TODO change this to a class instance variable or something
    end
    

    @@available_classes = Set.new

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
      

      load_names
    end
    
    def load_names( patterns=['*.rb'] )
      lib_dir = File.dirname(__FILE__)
      patterns.each do |pat|
        full_pattern = File.join( lib_dir, 'Names', pat )
        Dir.glob( full_pattern ).each do |file|
          @@available_classes << file
        end
      end
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
      
      #TODO: check the beginning of each word has an uc letter
      
      #get a set of nots
      n = nots.map{|word| @@available_classes.classify_true(word)}.fold(:&)
      #get a set of wanteds
      cs = words.map{|word| @@available_classes.classify_true(word)}.fold(:&)
      
      cs = cs - n unless n.nil? #remove nots from wanteds
      
      cs.each do |c|
        require c
        fn = File.basename( c, File.extname( c ) ) #remove the extension
        fn = 'RandomPerson::Names::' + fn
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

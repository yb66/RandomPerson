module RandomPerson

  class Generator
    
    require_relative './choice.rb'
    require_relative './person.rb'
    
    attr_reader :generators
   
    # Sets up a list of generators
    # @example 
    #   g = RandomPerson::Generator.new
    def initialize
      @generators = [ ] 
    end

    
    # Build a choice generator
    # @param [RandomPerson::Choice] choice A Choice object.
    # @example 
    #   g.make_generator choice
    def make_generator( choice )
    f = -> {
        g = Generator.pick_gender( choice.gender_ratio )
        age = Generator.pick_age( choice.age_lower, choice.age_upper)
        
        person = Person.new(
          :gender =>  g, 
          :age => age,
          :dob => Generator.pick_dob( age )
        )
        
        if person.gender == 'm'   
          person.first = choice.malefirst.execute( person ) unless choice.malefirst.nil?
        else
          person.first = choice.femalefirst.execute( person ) unless choice.femalefirst.nil?
        end
          
        person.last = choice.last.execute( person ) unless choice.last.nil?#lastname, 
        person.prefix = choice.prefix.execute( person ) unless choice.prefix.nil? #title 
        person.suffix = choice.suffix.execute( person ) unless choice.suffix.nil?#suffix
        
        person
      }
      
      @generators << f
    end
    
    class << self
    
      #create a ratio that is made up of ranges
      #to help hit with multiple valued ratios
      def ratiod( ratio=[1,1] )
        sum = ratio.reduce(:+) #sum
        mult = 100.divmod( sum ).first #get a bigger spread of numbers
        ratio.map! { |n| n * mult }
        new_ratio = ratio.inject([0..0]) {|acc,n| acc + [acc.last.last ... (n + acc.last.last)] }
        new_ratio.shift #get rid of 0..0
        return new_ratio
      end 
      
      # Takes a ratio and uses this to randomly select either a male or a female. To get only males or only females, pass in a 0 for either gender to make sure of getting the other gender for definite.
      # @example To only get males:
      #   pick_gender( [1,0] )
      # @example To only get females:
      #   pick_gender( [0,1] )
      # @example To be likely to get 2 females to every male:
      #   pick_gender( [1,2] )
      # @param [optional,Array<Integer,Integer>] ratio The ratio of males to females expressed in an array, e.g. [1,1] is (a chance of) one male for every female, [1,2] is one male to two females. The default is [1,1].
      # @return [String] Returns a 'f' for female or an 'm' for male.
      def pick_gender( ratio=[1,1] ) #male first
        if ratio.length == 2
          return 'f' if ratio.first == 0
          return 'm' if ratio.last == 0 
        end
        rat = ratiod( ratio )
        r = rand(rat.last.last)
        case r
          when rat[0] then 'm'
          when rat[1] then 'f'
        end
      end

      def pick_age( lower=0, upper=100 )
        age =  rand(upper - lower).to_i + lower 
      end
      
      def pick_dob( y=16 )
        year  = Time.now.year - y
        month = rand(12) + 1;
        day   = rand( Date.days_in_month( year, month ) ) + 1 
        Time.local( year, month, day )
      end
      
    
    end #class << self
      
    

  

    def reset
      @generators = [ ] 
    end


  
  end

end
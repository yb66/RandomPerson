module RandomPerson

  module Generator
    
    require_relative './person.rb'
    
    # Build a demographic generator
    # @param [RandomPerson::Demographic] demographic The demographic you would like.
    # @example 
    #   Generator.make_generator demographic
    def self.make_generator( demographic )
    f = -> {
        g = Generator.pick_gender( demographic.gender_ratio )
        age = Generator.pick_age( demographic.age_lower, demographic.age_upper)
        
        person = Person.new(
          :gender =>  g, 
          :age => age,
          :dob => Generator.pick_dob( age )
        )
        
        if person.gender == 'm'   
          person.first = demographic.malefirst.execute( person ) unless demographic.malefirst.nil?
        else
          person.first = demographic.femalefirst.execute( person ) unless demographic.femalefirst.nil?
        end
          
        person.last = demographic.last.execute( person ) unless demographic.last.nil? #lastname, 
        person.prefix = demographic.prefix.execute( person ) unless demographic.prefix.nil? #title 
        person.suffix = demographic.suffix.execute( person ) unless demographic.suffix.nil?#suffix
        
        person
      }

      f
    end
    
      
      #create a ratio that is made up of ranges
      #to help hit with multiple valued ratios
      def self.ratiod( ratio=[1,1] )
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
      def self.pick_gender( ratio=[1,1] ) #male first
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

      def self.pick_age( lower=0, upper=100 )
        age =  rand(upper - lower).to_i + lower 
      end
      
      def self.pick_dob( y=16 )
        year  = Time.now.year - y
        month = rand(12) + 1;
        day   = rand( Date.days_in_month( year, month ) ) + 1 
        Time.local( year, month, day )
      end

    def self.reset
      @generators = [ ] 
    end


  
  end

end

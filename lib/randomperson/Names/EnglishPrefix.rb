module RandomPerson
  module Names

    class EnglishPrefix < Name
            
      def initialize
         
        @formats_ratiod = [ 0..47, 48..50, 51..70, 71..87, 88..99]
        
        @names = %w(Mr Dr Mrs Ms Miss )
      end
      
      def execute( person )
              
        if person.age < 17
          return 'Miss' if person.gender == 'f'
          return 'Mr'
        end
          
        r = rand(51) #0..50
        r += 49 if person.gender == 'f' #give 50% chance of being a Dr
  
        i = @formats_ratiod.index_in_range( r )
        return @names[i]
      end
    end
  end
end
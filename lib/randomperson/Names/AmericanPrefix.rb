module RandomPerson
  module Names

    class AmericanPrefix < Name
            
      def initialize
         
        @formats_ratiod = [ 0..47, 48..49, 50..69, 70..87, 88..99]
        
        @names = %w(Mr. Dr. Mrs. Ms. Miss )
      end
      
      def execute( person )
              
        if person.age < 17
          return 'Miss' if person.gender == 'f'
          return 'Mr.'
        end
          
        r = rand(100) #0..99
  
        i = @formats_ratiod.index_in_range( r )
        return @names[i]
      end
    end
  end
end
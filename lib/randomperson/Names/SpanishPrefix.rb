# coding: utf-8

module RandomPerson
  module Names

    class SpanishPrefix < Name
            
      def initialize
         
        @formats_ratiod = [ 0..47, 48, 49, 50..73, 74..99]
        
        @names          = %w(Sr. Dr. Dra. Sra. Srta.)
      end
      
      def execute( person )
              
        if person.age < 17
          return @names[4] if person.gender == 'f'
          return @names[0]
        end
          
        r = rand(51) #0..50
        r += 49 if person.gender == 'f' #give 50% chance of being a Dr
  
        i = @formats_ratiod.index_in_range( r )
        return @names[i]
      end
    end
  end
end
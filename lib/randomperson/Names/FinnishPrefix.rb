# coding: utf-8

module RandomPerson
  module Names

    class FinnishPrefix < Name
            
      def initialize
         
        @formats_ratiod = [ 0..47, 48..49, 50..69, 70..99]
        
        @names = %w(herra Dr rouva neiti)
      end
      
      def execute( person )
              
        if person.age < 17
          return @names[3] if person.gender == 'f'
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
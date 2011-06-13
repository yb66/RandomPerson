# encoding: UTF-8

module RandomPerson
  module Names

    class BritishPrefix < Name
            
      def initialize
         
        @formats_ratiod = [ 0..47, 48..49, 50..70, 71..87, 88..99]
        
        @names = %w(Mr Dr Mrs Ms Miss)
      end
      
      def execute( person )
              
        if person.age < 17
          return @names[4] if person.gender == 'f'
          return @names[0]
        end
          
        r = rand(100) #0..99
  
        i = @formats_ratiod.index_in_range( r )
        return @names[i]
      end
    end
  end
end
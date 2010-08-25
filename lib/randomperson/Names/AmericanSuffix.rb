module RandomPerson
  module Names

    class AmericanSuffix < Name
      
      def initialize
        @names = [ 'Jr.', ''] + %w( I II III IV V Sr. )
        @formats_ratiod = [ 0, 1..93, 94, 95, 96, 97, 98, 99]
      end
      
      def execute( person)
          
        r = rand(99)      
        if person.age > 17
          r += 1 #Jr can't happen
        end
              
        i = @formats_ratiod.index_in_range( r )
        return @names[i]
      end
    end      
  end 
end
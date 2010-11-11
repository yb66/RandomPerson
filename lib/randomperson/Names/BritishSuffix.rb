module RandomPerson
  module Names

    class BritishSuffix < Name
      
      def initialize
        @formats = {
        
         }
         
        @formats_ratiod = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9..59, 59..159]
        
        @names = %w( OBE, MBE, GBE, KBE, DBE, CBE, JP, GM, PhD BSc, BA )
      end
      
      def execute( person )
        retval = nil
        r = rand(999)      
        unless person.age < 17 #sorry kids, but you ain't gonna get these
          i = @formats_ratiod.index_in_range( r )
          retval = @names[i] unless i.nil?
        end

        return retval 
      end
    end      
  end 
end


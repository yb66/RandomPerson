module RandomPerson

  class BritishSuffix < Name
    
    def initialize
      @formats = {
      
       }
       
      @formats_ratiod = [ 0, 1, 2, 3, 4, 5, 6..18, 98, 99]
      
      @names = %w( OBE, MBE, GBE, KBE, DBE, CBE, JP, GM, BSc, BA )
    end
    
    def execute( person )
        
        r = rand(99)      
        if person.age > 17
          r += 1 #Jr can't happen
        end
              
        i = @formats_ratiod.index_in_range( r )
        return @names[i]
    end
      
  end 
end


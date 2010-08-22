#!/usr/bin/env ruby -wKU

module RandomPerson
  require 'Names'
  class EnglishSuffix
    include Names
    
    
    SUFFIX = %w( OBE, MBE, GBE, KBE, DBE, CBE, JP, GM, BSc, BA )
    SUFFIX_ratiod = [ 0, 1, 2, 3, 4, 5, 6..18, 98, 99]
    
    def execute( person, &format)
        
        r = rand(99)      
        if person.age > 17
          r += 1 #Jr can't happen
        end
              
        i = SUFFIX_ratiod.index_in_range( r )
        return SUFFIX[i]
    end
      
  end 
end


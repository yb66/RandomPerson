#!/usr/bin/env ruby -wKU

module RandomPerson
  require 'Names'
  class AmericanSuffix
    include Names
    
    
    SUFFIX = [ 'Jr.', ''] + %w( I II III IV V Sr. )
    SUFFIX_ratiod = [ 0, 1..93, 94, 95, 96, 97, 98, 99]
    
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
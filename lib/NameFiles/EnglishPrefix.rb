#!/usr/bin/env ruby -wKU

module RandomPerson
  require 'Names'
  class EnglishPrefix
    include Names
          
      TITLES = %w(Mr. Dr. Mrs. Ms. Miss )
      TITLES_ratiod = [ 0..47, 48..50, 51..52, 53..81, 82..99]
      
      def execute( person, format=nil)
              
        if person.age < 17
          return 'Miss' if person.gender == 'f'
          return 'Mr.'
        end
          
        r = rand(51) #0..50
        r += 49 if person.gender == 'f' #give 50% chance of being a Dr

        i = TITLES_ratiod.index_in_range( r )
        return TITLES[i]
      end

  end
end
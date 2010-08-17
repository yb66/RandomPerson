#!/usr/bin/env ruby -wKU

module RandomPerson
  require 'Names'
  class EnglishPrefix
    include Names
          
      TITLES = %w(Mr. Dr. Mrs. Ms. Miss )
      TITLES_ratiod = [ 0...48, 48...51, 51...53, 53...82, 82..100]
      def execute( person, &format)
              
        if age < 17
          return 'Miss' if gender == 'f'
          return 'Mr.'
        end
          
        r = rand(50)
        r += 48 if gender == 'f'

        i = TITLES_ratiod.index_in_range( r )
        return TITLES[i]
      end

  end
end
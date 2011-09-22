# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class AmericanPrefix < Name

      Names = %w(Mr. Dr. Mrs. Ms. Miss)
            
      def initialize
        @names = Names         
        @formats = [ nil ]
        @formats_ratiod = [ 0..48, 49..50, 51..69, 70..87, 88..99]
        @possibles = Hash[ @formats_ratiod.zip @names ]
      end
      
      def execute( person )
              
        name = if person.age < 17
          person.gender == 'f' ? 'Miss' : 'Mr.'
        else
          r = rand( 48 + 1)
          r += 50 if person.gender == "f"
          @possibles.each_pair{|k,v| break v if k === r }
        end
          
        return name
      end
    end
  end
end

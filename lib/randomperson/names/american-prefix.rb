# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class AmericanPrefix < Name

      # @private            
      Names = %w(Mr. Dr. Mrs. Ms. Miss)
            
      def initialize
        @names = Names
        @formats_ratiod = [ 0..48, 49..50, 51..69, 70..87, 88..99]
        @possibles = Hash[ @formats_ratiod.zip @names ]
        
        @on_execute = for_prefixes( 'Miss', 'Mr.' )

        super
      end # initialize
      
    end # class
  end
end

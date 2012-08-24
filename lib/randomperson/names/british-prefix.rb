# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class BritishPrefix < Name
      
      # @private            
      Names = %w(Mr Dr Mrs Ms Miss)
            
      def initialize
        @names = Names
        @formats_ratiod = [ 0..47, 48..49, 50..70, 71..87, 88..99]
        @possibles = Hash[ @formats_ratiod.zip @names ]
        @on_execute = for_prefixes( 'Miss', 'Mr' )
        super
      end
      
    end
  end
end

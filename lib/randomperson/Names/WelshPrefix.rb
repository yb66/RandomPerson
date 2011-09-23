# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class WelshPrefix < Name
            
      Names = %w(Mr Dr Mrs Ms Miss)

      def initialize
        @names = Names
        @formats_ratiod = [ 0..47, 48..49, 50..70, 71..87, 88..99]
        @on_execute = for_prefixes( 'Miss', 'Mr' )
        super
      end
      
    end
  end
end

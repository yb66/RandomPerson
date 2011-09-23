# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class BritishSuffix < Name

      Names = %w( OBE, MBE, GBE, KBE, DBE, CBE, JP, GM, PhD BSc, BA )
      
      def initialize
        @names = Names
        @formats = []
        @formats_ratiod = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9..59, 59..159]
        @possibles = Hash[ @formats_ratiod.zip @names ]

        @on_execute = for_prefixes( nil, nil, 16, 160, 0 )
        
        super
      end
      
    end      
  end 
end


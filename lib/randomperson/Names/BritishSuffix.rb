# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class BritishSuffix < Name

      Names = %w( OBE MBE GBE KBE DBE CBE JP GM PhD BSc BA )
      
      def initialize
        @names = Names
        @formats = nil 
        @formats_ratiod = [ 0..0, 1..1, 2..2, 3..3, 4..4, 5..5, 6..6, 7..7, 8..8, 9..59, 59..159]
        @possibles = Hash[ @formats_ratiod.zip @names ]

        on_execute do |person|
          unless person.age <= 16
            r = rand(@formats_ratiod.last.end + 1 )
            @possibles.each_pair{|k,v| break v if k === r }
          else
            ""
          end 
        end

        super
      end
      
    end      
  end 
end


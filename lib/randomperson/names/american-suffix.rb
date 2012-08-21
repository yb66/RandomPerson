# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class AmericanSuffix < Name

      Names = [ 'Jr.', ''] + %w( I II III IV V Sr. )
      
      def initialize
        @names = Names
        @formats = nil
        @formats_ratiod = [ 0..0, 1..93, 94..94, 95..95, 96..96, 97..97, 98..98, 99..99]
        @possibles = Hash[ @formats_ratiod.zip @names ]
        
        on_execute do |person|
          r = rand(99)      
          if person.age > 17
            r += 1 #Jr can't happen and Snr can
          end

          @possibles.each_pair{|k,v| break v if k === r }
        end #
        
      end # initialize
      
    end # class
         
  end # Names
end # RandomPerson

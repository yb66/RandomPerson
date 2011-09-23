# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class SpanishPrefix < Name
            
      Names          = ["Sr.", "Dr.", "Dra.", "Sra.", "Srta."] 

      # the way this class is set up is different than usual
      # it's all just a shortcut, but it works
      def initialize
        @names = Names
        @formats_ratiod = [ 0..48, 49..49, 50..50, 51..74, 75..99]
        @possibles = Hash[ @formats_ratiod.zip @names ]

        @on_execute = for_prefixes( @names.last, @names.first )
        
        super
      end

    end # class
  end # Names
end # RandomPerson

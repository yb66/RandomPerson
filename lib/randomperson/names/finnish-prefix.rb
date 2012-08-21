# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class FinnishPrefix < Name

      # @private            
      Names =  %w(herra Dr rouva neiti)
            
      def initialize
        @names = Names
        @formats = [ nil ]
        @formats_ratiod = [ 0..48, 49..50, 51..70, 71..99]
        @possibles = Hash[ @formats_ratiod.zip @names ]
        
        @on_execute = for_prefixes( @names[3], @names.first )
        
      end # initialize
      

    
    end # class
  end
end

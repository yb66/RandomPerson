# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class FinnishPrefix < Name

      Names =  %w(herra Dr rouva neiti)
            
      def initialize
        @names = Names
        @formats = [ nil ]
        @formats_ratiod = [ 0..48, 49..50, 51..70, 71..99]
        @possibles = Hash[ @formats_ratiod.zip @names ]
        
        @on_execute = for_prefixes( @names[3], @names.first, child_age_upper_bound=16, female_lower_bound=50, male_upper_bound=50 )
        
      end # initialize
      

    
    end # class
  end
end

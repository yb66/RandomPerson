# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class EnglishLast < Name
      
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.rand },
          ->(n)   { n.rand + '-' + n.rand },
         ]
        @formats_ratiod = [ 0..96, 97..99 ]
        super
      end
  
      Names = %w{ Smith Brown Taylor Johnson Walker Wright Robinson Thompson White Green Hall Wood Harris Martin Jackson Clarke Clark Turner Hill Cooper Ward Moore King Watson Baker Harrison Young Allen Mitchell Anderson Lee Bell Parker Davis Bennett Miller Cook Shaw Richardson Carter Collins Marshall Bailey Gray Cox Adams Wilkinson Foster Chapman Mason Russell Webb Rogers Hunt Mills Holmes Palmer Matthews Fisher Barnes Knight Harvey Barker Butler Jenkins Stevens Pearson Dixon Fletcher Hunter Howard Andrews Reynolds Elliott Fox Ford Saunders Payne West Day Pearce Brooks Bradley Dawson Walsh Lawrence Cole Atkinson Ball Spencer Armstrong Burton Booth Rose Webster Williamson Watts Hart Burns Wells }
    end    
  end
end

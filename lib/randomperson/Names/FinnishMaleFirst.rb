# coding: utf-8

module RandomPerson
  module Names

    class FinnishMaleFirst < Name
  
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
         }
         
        @formats_ratiod = [ (0..99) ]
        setupnames
      end
        
      def setupnames
        @names = %w{ Antero Ilmari Johannes Juhani Kalevi Matti Mikael Olavi Tapani Tapio }
      end
    end    
  end
end
 


 
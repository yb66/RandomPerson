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
        @names = %w{ Juhani Johannes Olavi Antero Tapani Kalevi Tapio Matti Mikael Ilmari }
      end
    end    
  end
end
 


 
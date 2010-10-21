module RandomPerson
  module Names

    class FinnishFemaleFirst < Name
  
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
         }
         
        @formats_ratiod = [ (0..99) ]
        setupnames
      end
        
      def setupnames
        @names = %w{ Maria Annikki Hannele Liisa Anna Marjatta Kaarina Anneli Johanna Helena }
      end
    end    
  end
end
 
 
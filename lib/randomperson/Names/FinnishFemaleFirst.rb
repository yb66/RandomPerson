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
        @names = %w{ Aino Anna Anneli Annikki Hannele Helena Johanna Kaarina Liisa Maria Marjatta Selma Tuuli }
      end
    end    
  end
end
 
 
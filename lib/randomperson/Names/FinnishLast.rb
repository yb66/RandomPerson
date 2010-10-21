module RandomPerson
  module Names

    class FinnishLast < Name
      
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand }
         }
       
        @formats_ratiod = [ (0..99) ]
        setupnames
      end  
      
      def setupnames
        @names = %w( Korhonen Virtanen Nieminen Mäkinen Mäkelä Hämäläinen Laine Koskinen Heikkinen Järvinen )
      end
      
    end 
  end
end  



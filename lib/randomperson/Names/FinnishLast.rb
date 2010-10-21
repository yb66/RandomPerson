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
        @names = %w( Heikkinen Hämäläinen Järvinen Korhonen Koskinen Laine Mäkelä Mäkinen Nieminen Virtanen )
      end
      
    end 
  end
end  



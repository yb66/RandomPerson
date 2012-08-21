# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class FinnishLast < Name
      
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.sample }
         ]
        @formats_ratiod = [ (0..99) ]
        super
      end  
      
      # @private            
      Names = %w( Heikkinen Hämäläinen Järvinen Korhonen Koskinen Laine Mäkelä Mäkinen Nieminen Virtanen )
      
    end 
  end
end  



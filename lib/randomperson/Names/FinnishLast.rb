# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class FinnishLast < Name
      
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.rand }
         ]
        @formats_ratiod = [ (0..99) ]
        super
      end  
      
      Names = %w( Heikkinen Hämäläinen Järvinen Korhonen Koskinen Laine Mäkelä Mäkinen Nieminen Virtanen )
      
    end 
  end
end  



# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class FinnishFemaleFirst < Name
  
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.sample },
         ]
         
        @formats_ratiod = [ (0..99) ]
        super
      end
        
      # @private            
      Names = %w{ Aino Anna Anni Anneli Annikki Hannele Helena Inari Johanna Kaarina Liisa Maria Marjatta Riikka Selma Tuuli }
    end    
  end
end
 
 

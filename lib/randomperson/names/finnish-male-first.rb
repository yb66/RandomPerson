# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class FinnishMaleFirst < Name
  
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.rand },
         ]
        @formats_ratiod = [ (0..99) ]
        super
      end
        
      Names = %w{ Antero Ilmari Johannes Juhani Kalevi Matti Mikael Olavi Tapani Tapio }
    end    
  end
end
 


 

# encoding: UTF-8

module RandomPerson
  module Names

    class BasqueMaleFirst < Name
    
      def initialize
        @formats = {
          :single => ->(n){ n.rand },
         }
         
        @formats_ratiod = [ 0..99 ]
        setupnames
      end
      
      def setupnames
        @names = %w{ Abarron Aingeru Aïtor Alesander Ander Antton Apal Aresti Asentzio Balendin Barea Basa-Jaun Belasco Beñat Bernat Bingen Bittor Bixente Danel Domeka Edorta Edrigu Ekaitz Elazar Eli Endika Eneco Erramun Estebe Gabirel Gaizka Gero Gorka Gotzon Guerechen Imanol Iñigo Ion Izar Jakome Joanes Jokin Joseba Julen Koldo Koldobika Lertxun Lizardi Markel Marko Mattin Mikel Mitxel Nikola Patxi Paulo Salbatore Sendoa Todor Tubal Txomin Umea Xabier Xalbador Xarles Xaviar Xavier Xemen Ximun Yorge Yuli Zeru Zigor Zuhaitz Zuri }
      end
      
    end
  end
end 
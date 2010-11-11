# coding: utf-8

module RandomPerson
  module Names

    class BasqueFemaleFirst < Name
    
      def initialize
        @formats = {
          :single => ->(n){ n.rand },
         }
         
        @formats_ratiod = [ 0..99 ]
        setupnames
      end
      
      def setupnames
        @names = %w{ Agurtzane Ainhoa Aintzane Alazne Alize Amaia Ametza Andere Angelu Apala Argi Arima Arrosa Artizar Berezi Bihotz Catalin Dominica Edurne Elizabete Eneca Fede Gotzone Graciosa Guerechene Iñiga Katerin Kattalin Lide Lili Maitagarri Maite Maitea Margaita Mirari Therese Udaberri Ximena Yuana Zaballa Zeru Zurina Zuriñe }
      end
      
    end
  end
end 
 
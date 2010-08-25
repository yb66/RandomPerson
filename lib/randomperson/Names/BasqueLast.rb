# coding: utf-8

module RandomPerson
  module Names

    class BasqueLast < Name
    
      def initialize
        @formats = {
          :double_barrelled => ->(n){ n.rand + ' ' + n.rand },
         }
         
        @formats_ratiod = [ 0..99 ]
        setupnames
      end
      
      def setupnames
        @names = %w{ Agirre Aguirre Alberdi Allende Alsogaray Alurralde Amézaga Arana Aráoz Araya Archuleta Arismendi Armendáriz Arriaga Arrieta Ayala Ayala Azcárraga Azcárate Azua Barrios Bengoechea Bolívar Buenechea Caínzos Camus Cano Caro Carranza Carrera Duhalde Echenique Echevarria Echeverría Elissalde Elizalde Elizondo Esparza Esquivel Etcheverry Etxeberria Eyzaguirre Garay García Garmendia Goicoechea Gorostiaga Goya Goyeneche Ibarra Landa Larraín Loyola Mendieta Mendoza Montoya Mujica Murua Ochoa Oñate Orozco Palacio Salazar Saldívar Solano Ugalde Ugarte Urbina Uribe Urquiza Urrutia Ursúa Velasco Vergara Vizcaino Vizcarra Xavier Ybarra Zabala Zaldívar Zavaleta Zúñiga Zurita }
      end
    end
  end
end


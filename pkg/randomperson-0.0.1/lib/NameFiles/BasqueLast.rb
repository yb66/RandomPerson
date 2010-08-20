#!/usr/bin/env ruby -wKU
# coding: utf-8

module RandomPerson

  require 'Names'

  class BasqueLast
    include Names

    #def names() NAMES; end
    
    def initialize
      @formats = {
        :single    => ->(n){ n.rand },
       }
       
      @formats_ratiod = [ 0..99 ]
    end
     
    attr_accessor :formats, :formats_ratiod
    
    def execute( person, format=nil )
      if @formats.length > 1      
        r = rand(@formats_ratiod.last.end)
        i = @formats_ratiod.index_in_range( r )
        f = @formats.by_index(i).last
      else
        f = @formats[:double_barrelled] 
      end
      
      Names.execute( NAMES, f )
    end 


    NAMES = %w{ Agirre Aguirre Alberdi Allende Alsogaray Alurralde Amézaga Arana Aráoz Araya Archuleta Arismendi Armendáriz Arriaga Arrieta Ayala Ayala Azcárraga Azcárate Azua Barrios Bengoechea Bolívar Buenechea Caínzos Camus Cano Caro Carranza Carrera Duhalde Echenique Echevarria Echeverría Elissalde Elizalde Elizondo Esparza Esquivel Etcheverry Etxeberria Eyzaguirre Garay García Garmendia Goicoechea Gorostiaga Goya Goyeneche Ibarra Landa Larraín Loyola Mendieta Mendoza Montoya Mujica Murua Ochoa Oñate Orozco Palacio Salazar Saldívar Solano Ugalde Ugarte Urbina Uribe Urquiza Urrutia Ursúa Velasco Vergara Vizcaino Vizcarra Xavier Ybarra Zabala Zaldívar Zavaleta Zúñiga Zurita }

  end
end


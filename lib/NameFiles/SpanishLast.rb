#!/usr/bin/env ruby -wKU

module RandomPerson

  require 'Names'

  class SpanishLast
    include Names

    #def names() NAMES; end
    
    def initialize
      @formats = {
        :double_barrelled=> ->(n)   { n.rand + ' ' + n.rand },
       }
       
      @formats_ratiod = [ (0..99) ]
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


    NAMES = %w{ Abarca Acarons Acosto Acuoa Adega Agassiz Agia Aguero Aguila Aguilar 
Aguilera Aguirre Aicega Alaminos Alas Albanese Albano Albarracin Albenino 
Albo Albornos Alcantara Aldama Alday Alderate Alegria Aleixandre Alemany 
Alemao Alkorta Allende Almagro Almendros Almeyda Alonso Altamirano Alvarez 
Alvaro Alvear Alzugaray Amatrian Amavisca Amendola Amor Anaya Andrés 
Angeloz Angulo Antón Antuma Aragon Aranda Arbizu Archuleta Arellano 
Arispana Aristia Aristizabal Aristzabal Armas Armendariz Armesto Arnal 
Arrese Arria Arruti Arrutti Arteaga Arzu Ascencion Aspe Asprilla Avellanos 
Ayala Azaria Aznar Badillo Bajtera Balbi Balbo Balboa Ballestero 
Ballesteros Balmaceda Banderas Barón Baradez Baraona Barba Barchitta 
Bardem Barjuan Barreiro Barrenechea Barrichello Barrigo Barrio Basadre 
Batistuta Batiz Batran Bauza Bazán Bea Becerra Becerril Belaúnde Bello 
Beloki Belsue Beltrones Benavides Benet Benitez Benítez Berganza Bergasa 
Berlanga Bermejo Bermudez Bernabé Bernal Bernaldez Beto Blanco Boedo 
Bolano Bolea Borges Borrego Bote Braga Bravo Bricenos Brizeno Brizuela 
Brugera Bueno Buey Bugeja Bunuel Burillo Burrieza Busques Bustos Caballero 
Cabellero Cabello Cabral Cabrero Cacares Cacho Cachon Cadena Cadero Cafu 
Caio Calatrava Caldern Calero Calvo Camacho Camardan Camardiel Camillo 
Caminero Campo Campos Canal Canans Canas Canellas Canesa Canete Cano 
Canseco Canura Carabali Carballo Carbajal Carbonell Carbonero Cardenas 
Carderas Carmona Carranco Carranzo Carrasco Carreno Carrera Carretero 
Carriedo Carriles Carrión Carvalho Casald liga Casamayor Casas Cascos 
Casero Caso Castanada Castaneda Castilla Castillo Castrejana Castrilli 
Castro Castulo Catalan Catano Cea Ceballos Celades Centurión Cerezo Ceron 
Cervano Cervantes Cervera Chamot Chapado Chascarillo Chaves Chavira Checa 
Chedraui Chiamuhera Chiamulera Chico Chilavert Chillida Cieza Cisneros 
Clavet Clavijero Clemente Clopes Cobo Coceres Coelho Cois Cojuango 
Concepcion Contreras Corbacho Corbelan Cordero Cordobes Cordona Cordova 
Cornejo Coronel Corral Corrales Correa Corretja Cortez Cortina Corvalan 
Coya Cresaco Crespo Criado Criville Crusellas Cruz Cubrero Cuéllar Cuello 
Cuenca Cuervo Cuesta Cúneo-Vidal Da Gama Dabino Damián Dávila Dávilo 
Davino De Alencar De Assis De Cabrea De Caxias De Jesus De La Garza De La 
Iglesia De la Madrid De La Rosa De la Vega De Lacerda De Mena De Mendoza 
De Rosas De Saldanha De Sancha De Souza De Tavira De Urquiza De Vivero 
Debarros Deferr Delmorales Delgado Diago Diaz Diego Diez Disegni Dominguez 
Dorantes Duany Duce Dunga Durán Echave Echevarria Edinho Edo Elcano 
Elixaeberna Elizondo Enciso Enrique Enriquez Erosa Escamillo Escartin 
Escriba Escriva Escuda Escudero Espejo Espinosa Espinoza Estay Estete 
Estrada Fabrega Fajardo Falcón Falla Fanez Farfán Feijoo Fejos Felipe 
Feliu Feo Fernández Ferrado Ferrer Figo Figueira Filho Fiz Flores Foa 
Fonseca Formoselle Fraga Francia Francisquito Franco Frechilla Frois 
Fuente Fuentes Fuginato Funes Gaite Galdarres Galíndez Galindo Gallardo 
Gallego Gama Gamarra Gamboa Gamez Gangotena Garbajosa Garcia Garcilaso 
Garibay Garrido Garza Gasco Gaspar Gasquilan Gastelú Gats Gavaldon Gavilán 
Giberau Gibernau Gil Ginez Girón Gomez Gomiz Gonzaga Gonzales Gorriz 
Granados Grande Guadalcázar Guaman Guardiola Guerra Guerrero Guerro 
Guevara Guillen Guimarães Guinassi Gumy Guruceta Gutiérrez Guzmán Henarez 
Henchoz Heras Hernandez Herrera Hidalgo Hierro Hoero Holguin Hoyos Huerta 
Huertas Hurtado Ibanez Icaza Idalia Iguaran Illan Imaz Iniguez Insulza 
Isambero Isasi Ivarra Jara Jaramillo Jimenez Juarez Jura Jurada Juradu 
Keiva Kiko Lamela Lanos Lapenti Lara Laredo Larraneta Lastres Lazaro 
Ledesma Len Leon Leona Lerma Lianos Lima Lissón Lizarraga Lizaur Llano 
Llosa Lopez Lora Lorca Loredo Lorente Lorenzo Losada Lozada Lozana Lozano 
Lucero Luenga Luna Lurdes Madero Magallanes Magarino Maldonado Mamita 
Manderiaga Manjarin Manrique Mantilla Manzo Marcari Marcelo Mardomingo 
Margas Marín Marquez Márquez Marquina Marroquín MartÍ Nez Martel Martinez 
Marulanda Masoliver Masolta Massana Mattez Matutes Mauri Mayo Mayor 
Mayoral Mazinho Medina Meira Mejia Meléndez Melgarejo Meligeni Meligenis 
Mena Menchu Mendez Mendieta Mendiluce Mendiola Menem Meolans Merino Merlo 
Merry Mery Messia Methol Mezo Miguez Milian Minguet Minoza Miralles 
Miranda Molina Mondello Monentes Monreal Montalvo Montana Montaña Montanes 
Montano Montavez Monte Montejo Montero Monteros Montez Montolio Montoro 
Montoya Montt Mora Moraga Morales Moran Morayta Morcillo Morel Moreno 
Moretta Morgovejo Morientes Moscoso Motolinía Moya Muniz Munoz Murillo 
Muro Murrieta Nabarro Naca Nadal Nadol Naharro Narvaez Nascimento Navaez 
Navarrete Navarro Nino Noboa Nolasco Noseda Núnez Obrégon Ocacio Ocampo 
Ochoa Odriozola Ogarrio Olano Olazabal Oliva Olmedo Olmos Oneta Oraglio 
Ordialds Ordiales Ordonez Orellana Orgónez Orizaga Orozco Orrego Ortega 
Orteguilla Ortiz Osario Osorio Otero P¾ rez Pacheco Padilla Paez Páez 
Palacios Palencia Pancorbo Pando Pánfilo Paraguez Pardo Paredes Pareds 
Parilla Parra Parrado Parraguez Parreira Parrera Pascual Passarella 
Pastrana Patino PeÔ alves PeÔ as Pedroso Pelaez Perahia Perdiguero Perez 
Periate Pessoa Peyrera Piedrahita Pimental Pineda Pinedo Pinelo Pinero 
Pinilla Pinto Pinzon Pinzón Pires Pita Pitillas Piza Pizarro Pizzaro 
Platas Plazas Poblano Polanco Polo Porcallo Porcel Porras Portas 
Portocarrero Posados Pracatan Prado Preciado Preciosa Pretel Prieto Prieto 
Puente Puerta Pueyo Puig Puiggros Pulido Puron Quehlas Queiro Querido 
Quesada Quesado Questi Quevedo Quintero Quirot Rudenas Rabal Radondo 
Raimondi Ramiez Ramirez Ramos Rangel Rascon Rebuelta Recio Regal Rengifo 
Restrepo Reto Rey Reyes Riba Ribadeneyra Riberol Rimoldi Rincon Rionda 
Riquelme Rivas Rivera Rivero Roa Robaina Robano Robledo Roca Rocha Rodas 
Rodriguez Roig Rojas Rojo Rollero Roma Romero Romo Rosas Rosauro Rovapera 
Rozadilla Ruano Rubiera Rubio Rubios Rubruquis Rucina Rudas Rufo Ruiberriz 
Ruiz Saavedra Sáenz Saer Sagredo Sahagún Sala Salarza Salas Saldamando 
Salgada Salinas Salto Salvatella Sámarez Samper Sanchez Sanchis Sandoval 
Sanin Sanroma Santa Maria Santana Santiago Santiseban Santoro Santos 
Santoyo Sanz Sarabia Sarmiento Sarsola Seabra Sebrian Seda Sedeno Segarra 
Segurola Senra-Silva Sepúlveda Sergi Serna Serpa Serra Serrano Sert Servia 
Siculo Sieres Sierra Siliceo Silloniz Soitino Solana Solano Soldadera 
Soldan Solozano Sortani Sosa Sota Sotelo Sotomayor Spano Sporleda Suarez 
Suárez Tallez Tabuyo Tadena Taffarel Tapia Tarrega Tavares Tejada Tello 
Teofilo Terezinho Terranova Terrazos Terreros Texidor Tintorero Toldeo 
Toledano Toledo Tomas Toriano Toribio Torrens Torres Torrillas Tortosa 
Tovar Troncoso Trujillo Tuero Tuscarora Ubidia Ugarte Ulloa Unzues Urrutia 
Urteaga Ussica Vaime Valcárcel Valderrama Valencia Valente Valenzuela 
Valero Vales Valignano Vallalpando Valle Vallejo Vaquero Varela Vargas 
Vargos Vasques Vazquez Vega Vegaso Vegros Velasco Velazquez Vélez Véliz 
Velloso Vendabal Vennera Vera Verdugo Verme Veron Viana Vicario Vila Villa 
Villalobos Villar Villaroel Villaruel Villasenor Viloca Vinciguerra 
Vingade Viola Vivas Vizcaino Volonte Vrais Woriega Xalmiento Xerez Ximenéz 
Xovi Xuárez Yanez Yegros Yocemento Yuste Zabaleta Zaga Zamarilla Zamorano 
Zapata Zavarjelos Zerbino Zhili Zorita Zuaza Zubero Zubizarreta Zuidema 
Zuluaga  }

  end
end
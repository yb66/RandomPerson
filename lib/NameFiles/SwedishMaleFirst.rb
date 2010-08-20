#!/usr/bin/env ruby -wKU

module RandomPerson

  require 'Names'

  class SwedishMaleFirst
    include Names

    #def names() NAMES; end
    
    def initialize
      @formats = {
        :single =>                      ->(n)   { n.rand },
       }
       
      @formats_ratiod = [ (0..99)]
    end
     
    attr_accessor :formats, :formats_ratiod
    
    def execute( person, format=nil )
      if @formats.length > 1
        r = rand(@formats_ratiod.last.end)
        i = @formats_ratiod.index_in_range( r )
        f = @formats.by_index(i).last
      else
        f = @formats[:single]
      end
      Names.execute( NAMES, f )
    end 


    NAMES = %w{ Abel Abraham Absalon Adam Adolf Adrian Ahl Albert Albin Albrekt Alexander Alf Alfred Algot Alle Allert Alrik Alvaster Amadeus Amandus Ambjörn Amund Ananias Anders Andor Andreas Anian Anifas Anselm Anton Antonius Använt Arent Arild Arkel Arne Arnfast Arnold Aron Artur Arvast Arvid Asbjörn Asger Asgöt Aslak Aslev Asmund Assar August Augustin Axel Baltsar Bardo Bartel Bastian Belagt Benal Bengt Benjamin Berge Bernhard Bernt Bertil Bertram Birger Björn Blanting Blasius Bo Bodel Bonde Borgar Borker Botolf Bottniska Botvid Brage Brodde Broder Bromme Bror Brun Bruno Bryngel Brynolf Brynte Bård Båtel Böke Börje Celius Dager Dan Daniel Denis Detlof Didrik Dionysius Djur Dominikus Ebbe Eberhard Eckard Edfast Edgar Edmund Edvard Edvin Efraim Eggert Egil Egron Einar Ejlert Ejvind Elf Elias Elieser Elis Ellebrat Elling Elof Elon Elver Elving Emanuel Embjörn Embrikt Emil En Enar Enevald Engelbert Engelbrekt Engle Enligt Enok Erasmus Erengisle Erhard Erik Erland Erling Ernfrid Ernst Esaias Esbjörn Eskil Eugen Evald Even Evert Fabian Fader Fajer Fale Faltin Fardhe Farman Faste Felix Ferdinand Filip Filpus Finnvid Florus Folke Folkvar Formen Frans Fredrik Frenne Fridolf Fritjof Frits Frosten Frände Frösten Fullmo Förekom Gabriel Gamaliel Gammal Geffle Georg Gerlak Germund Geronymus Gert Gertorn Gestil Gideon Gilbert Gilgen Gilius Gillis Gise Gisle Givlög Gjord Gofast Gottfrid Gotthard Gottskalk Gregers Grels Grim Gude Gudfast Gudlek Gudska Gudvast Gudvaster Gullbrand Gulle Gullik Gumme Gunbjörn Gunnar Gunne Gustav Guttorm Gyse Gälar Gästil Gödmar Göran Götar Göte Ha Habord Haftor Hakvin Halle Halsten Halvard Halvor Hammen Hans Harald Harok Hartman Hartvig Heden Helge Helmer Hemming Hennike Henning Henrik Herbert Herlek Herlof Herman Hermod Herse Hidhin Hieronymus Hildebrand Hiller Hindrik Hinse Hjerton Holger Holmfast Holmger Holmvid Holsten Holvaster Holvid Homger Hornby Hubert Hugo Hälje Håbbol Håkan Hård Håvel Ilian Inge Ingebrekt Ingel Ingeman Ingemar Ingemund Inger Ingevald Ingjald Ingolf Ingvar Isak Isidor Israel Ivan Ivar Jakob Jan Jap Japer Jarl Jasper Jeppe Jeremias Jesper Jfr Joakim Jockum Joducus Joel Joen Johan Johannes John Jon Jonas Jonatan Jord Jordan Josef Josias Jost Jul Julius Jurd Jurgen Jurian Jurien Justus Järle Jåp Jåper Jöns Jörgen Jösse Karl Karsten Kasimir Kasper Kersten Kettil Kjell Kjellar Kjellbjörn Kjellmund Kjellvast Klas Klemet Knut Konrad Konstantin Korfits Kornelius Kort Kristen Kristian Kristiern Kristofer Krok Kruse Kurt Käll König Lage Lambert Lambrekt Lars Lave Leander Leckard Lek Lennart Leo Leonard Levin Libert Lindorm Linnar Linus Loe Lorens Louis Love Ludvig Lukas Lyder Lövert Magnus Malkolm Malte Manne Marius Markus Markvard Marsilius Martin Mats Matteus Mattias Maurits Meddelande Melker Mickel Mikael Modéer Moses Måns Mårten Namnet Nanne Napoleon Natanael Niklas Nikodemus Nikolaus Nils Njord Noak Odert Offe Ola Olaus Ole Oliver Olof Orm Ormar Oskar Ossian Otte Otto Ove Palle Palne Pascalis Patrik Paul Peder Per Pet Petrus Petter Polykarpus Pontus Prebjörn Pähr På Pål Påske Påvel Rafael Ragvald Ral Ramund Rasmus Raval Rear Reimund Reineke Reinhard Rikard Roar Robert Roel Roger Rol Roland Rolf Rolof Ruben Rudolf Rutger Sakarias Sakris Salmund Salomon Samson Samuel Sander Sante Sasser Se Sebastian Sebbe Sebjörn Sefast Seger Segol Selius Serva Set Sevast Seved Severin Sibbe Sibbjörn Siffer Sigbjörn Sigleif Sigmund Sigurd Sigvard Sigvid Simon Sivert Sixten Sjul Sjunne Skarel Skåning Somman Sone Spjälbo Spjälle Stefan Stellan Sten Stenbjörn Stenkil Storbjörn Stricker Strånge Sture Styrbjörn Störje Sundvis Sune Svante Sven Svenning Sverker Sverkil Sylvester Såne Söffring Sören Tage Teodor Teofil Teus Tideman Tidik Timan Timoteus Tobias Tol Tolf Tolle Tomas Torbjörn Tord Tore Torfrid Torger Torla Tormar Torsten Torvald Torvid Toste Tove Troed Tron Trotte Trued Tue Tule Tulson Ture Tuve Tyke Tyko Typiskt Tyres Tönnes Töres Törje Törne Ubbe Udde Ulf Ulrik Une Unge Uno Urban Valdemar Valentin Valfrid Valter Vanik Vaste Velam Ventsel Verner Vernik Viar Vibjörn Vidik Vifast Viktor Vilhelm Vilken Villam Vimund Vincent Vinnan Vitus Vivast Vollemar Vollrat Volmar Volter Ygge Yngve us Äldsta Ärnbjörn Åbjörn Åke Åne Årad Åsle Åsmund Åstrad Åsvid Ödger Ögge Öjar Öjvind Önne Örjan Övid }
 end 
end
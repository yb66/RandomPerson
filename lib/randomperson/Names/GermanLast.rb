module RandomPerson
  module Names

    class GermanLast < Name
      
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand }
         }
       
        @formats_ratiod = [ (0..99) ]
        setupnames
      end  
      
      def setupnames
        @names = %w(Müller Schmidt Schneider Fischer Weber Meyer Wagner Becker Schulz Hoffmann Schäfer Koch Bauer Richter Klein Wolf Schröder Neumann Schwarz Zimmermann Braun Krüger Hofmann Hartmann Lange Schmitt Werner Schmitz Krause Meier Lehmann Schmid Schulze Maier Köhler Herrmann König Walter Mayer Huber Kaiser Fuchs Peters Lang Scholz Möller Weiß Jung Hahn Schubert Vogel Friedrich Keller Günther Frank Berger Winkler Roth Beck Lorenz Baumann Franke Albrecht Schuster Simon Ludwig Böhm Winter Kraus Martin Schumacher Krämer Vogt Stein Jäger Otto Sommer Groß Seidel Heinrich Brandt Haas Schreiber Graf Schulte Dietrich Ziegler Kuhn Kühn Pohl Engel Horn Busch Bergmann Thomas Voigt Sauer Arnold Wolff Pfeiffer )
      end
      
    end 
  end
end  



module RandomPerson
  module Names

    class FrenchMaleFirst < Name
  
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
          :double_barrelled_hyphenated => ->(n)   { n.rand + '-' + n.rand },
         }
         
        @formats_ratiod = [ 0..49, 65..99 ]
        setupnames
      end
        
      def setupnames
        @names = %w{ Adrien Aimé Alain Alexandre Alexi Alfred Alphonse Amaur André Antoine Anto Arnau Arthur Auguste Augustin Benjamin Benoît Bernard Bertrand Brun Charles Christia Christophe Claude Cyrille Daniel David Denis Didie Dominique Édouard Émile Emmanuel Éric Étienne Eugène Francis François Franck Frédéric Gabriel Gasto Georges Gérard Gilbert Gilles Grégoire Guillaume Guy Gustav Henri Honoré Hugues Isaac Jacques Jacquot Jean Jeannot Jérôme Joseph Jules Julien Laurent Léon Louis Luc Lucas Marc Marcel Martin Matthieu Maurice Michel Nicolas Noël Olivier Pasca Patrick Patrice Paul Philippe Pierre Raymond Rémy René Richard Robert Roger Roland Sébastien Serg Stéphane Théodore Théophile Thibaut Thierry Thomas Timothée Tristan Victor Vincent Xavier Yves Zacharie }
      end
    end    
  end
end



 
module RandomPerson
  module Names

    class FrenchFemaleFirst < Name
  
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
          :double_barrelled_hyphenated => ->(n)   { n.rand + '-' + n.rand },
         }
         
        @formats_ratiod = [ 0..49, 65..99 ]
        setupnames
      end
        
      def setupnames
        @names = %w{ Adélaïde Adèle Adrienne Agathe Agnès Aimée Alexandri Alix Alice Amélie Anaï Anastasie Andrée Anne Anou Antoinette Arnaud Astri Audrey Auréli Aurore Bernadett Brigitte Camill Capucine Caroline Catherine Cécile Céline Chanta Charlotte Christell Christian Christine Claire Claude Claudine Clémence Colett Constance Corinn Danielle Denise Diane Dominique Dorothée Édith Éléonore Élisabeth Élise Élodi Émilie Emmanuelle Florence Françoise Frédérique Gabrielle Genevièv Hélène Henriette Hortens Inès Isabelle Jacqueline Jeanne Jeannine Joséphine Josett Julie Juliette Laetitia Laure Laurenc Lorraine Louise Luce Madeleine Mano Marcell Margaux Marguerite Margot Marianne Marie Marine Marthe Martin Marys Mathilde Michèle Monique Nathalie Nath Nicole Noémi Océan Odett Olivie Patricia Paulett Pauline Pénélope Philippin Renée Sabin Simon Sophie Stéphanie Susanne Sylvie Thérèse Valentine Valérie Véronique Victoire Virginie Zoé  }
      end
    end    
  end
end




module RandomPerson
  module Names

    class FrenchLast < Name
      
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
          :double_barrelled_hyphenated => ->(n)   { n.rand + '-' + n.rand },
         }
         
        @formats_ratiod = [ (0..96), (97..99) ]
        setupnames
      end
  
      def setupnames
        @names = %w{ Martin Bernard Thomas Petit Robert Richard Durand Dubois Moreau Laurent Simon Michel Lefebvre Leroy Roux David Bertrand Morel Fournier Girard Bonnet Dupont Lambert Fontaine Rousseau Vincent Muller Lefevre Faure Andre Mercier Blanc Guerin Boyer Garnier Chevalier Francois Legrand Gauthier Garcia Perrin Robin Clement Morin Nicolas Henry Roussel Mathieu Gautier Masson Marchand Duval Denis Dumont Marie Lemaire Noel Meyer Dufour Meunier Brun Blanchard Giraud Joly Riviere Lucas Brunet Gaillard Barbier Arnaud Martinez Gerard Roche Renard Schmitt Roy Leroux Colin Vidal Caron Picard Roger Fabre Aubert Lemoine Renaud Dumas Lacroix Olivier Philippe Bourgeois Pierre Benoit Rey Leclerc Payet Rolland Leclercq Guillaume Lecomte Lopez Jean Dupuy Guillot Hubert Berger Carpentier Sanchez Dupuis Moulin Louis Deschamps Huet Vasseur Perez Boucher Fleury Royer Klein Jacquet Adam Paris Poirier Marty Aubry Guyot Carre Charles Renault Charpentier Menard Maillard Baron Bertin Bailly Herve Schneider Fernandez Le Gall Collet Leger Bouvier Julien Prevost Millet Perrot Daniel Le Roux Cousin Germain Breton Besson Langlois Remy Le Goff Pelletier Leveque Perrier Leblanc Barre Lebrun Marchal Weber Mallet Hamon Boulanger Jacob Monnier Michaud Rodriguez Guichard Gillet Etienne Grondin Poulain Tessier Chevallier Collin Chauvin Da Silva Bouchet Gay Lemaitre Benard Marechal Humbert Reynaud Antoine Hoarau Perret Barthelemy Cordier Pichon Lejeune Gilbert Lamy Delaunay Pasquier Carlier Laporte Gros Buisson Ollivier Briand Alexandre Georges Guillou Besnard Legros Gonzalez Coulon Maillot Albert Camus Delattre Launay Hebert Lesage Blanchet Didier Voisin Pons Bousquet Coste Vallee Jacques Martel Maury Raynaud Barbe Pascal Bigot Verdier Charrier Sauvage Guillet Mahe Leduc Lelievre Gregoire Joubert Masse Delmas Morvan Lebreton Tanguy Pineau Lebon Gaudin Colas Imbert Paul Raymond Guillon Brunel Regnier Ferrand Hardy Devaux Courtois Bodin Chauvet Allard Blondel Laine Delorme Seguin Lenoir Berthelot Bonneau Pereira Thibault Lacombe Riou Lagarde Clerc Bruneau Godard Vaillant Couturier Gomez Jourdan Pages Valentin Lombard Mary Blin Texier Rossi Marion Allain Maurice Guilbert Baudry Dupre Marin Evrard Hoareau Turpin Bourdon Lefort Legendre Chartier Gilles Lacoste Loiseau Duhamel Laroche Ferreira Rousset Toussaint Wagner Fischer Normand Maillet Guibert Labbe Bazin Rocher Bonnin Merle Jacquot Grenier Valette Leconte Peltier Pruvost Auger Vallet Pottier Descamps Parent Boutin Potier Chauveau Martineau Hernandez Neveu Peron Delahaye Vial Blot Delage Lemonnier Petitjean Maurin Rodrigues Cros Lafon Faivre Chretien Fouquet Serre Favre Becker Foucher Guyon Joseph Mace Dos Santos Gallet Charbonnier Bouvet Salmon Le Corre Fernandes Bernier Rossignol Delannoy Levy Prigent Lecoq Thierry Cornu Girault Jourdain Begue Andrieu Maurel Ruiz Parmentier Guy Laborde Gras Goncalves Castel Gervais Boulay Chapuis Samson Duclos Dijoux Chambon Stephan Sabatier Poncet Besse Weiss Doucet Bonhomme Hamel Berthier Letellier Prevot Grand Grandjean Benoist Leblond Gosselin Leleu Comte Favier Bellanger Martinet Billard Rault Geoffroy Forestier Blondeau Roques Ricard Pommier Boulet Drouet Poisson Maire Mounier Gueguen Combes Huguet Morand Leonard Ledoux Prat Dubreuil Fortin Ferre Rigaud Brossard Picot Granger Merlin Laval Claude Marquet Mouton Brault Jeanne Marc Levasseur Le Roy Guillemin Bocquet Constant Pujol Lavigne Bauer Hoffmann Chatelain Lacour Jung Jamet Lallemand Walter Basset Provost Salaun Tellier Gibert Martins Rose Navarro Grange Lepage Bouquet Keller Techer Jolly Tournier Guillard Papin Bataille Lelong Cartier Leon Champion Dujardin Dumoulin Lasserre Flament Husson Schmidt Le Bihan Kieffer Millot Le Guen Ferry Bourdin Mangin Gicquel Cadet Soulier Mignot Barret Bureau Leray Fort Barreau Mas Lafont Bouchard Jolivet Savary Foulon Guillemot Costa Armand Blaise Binet Montagne }
      end
    end    
  end
end


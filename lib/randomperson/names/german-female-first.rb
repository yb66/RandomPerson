# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class GermanFemaleFirst < Name
  
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.sample },
        ]
        @formats_ratiod = [ (0..99) ]
        super
      end
        
      # @private            
      Names = %w{ Andrea Angelika Anja Anke Anna Annett Antje Barbara Birgit Brigitte Christin Christina Claudia Daniela Diana Doreen Franziska Gabriele Heike Ines Jana Janina Jennifer Jessica Julia Juliane Karin Karolin Katharina Kathrin Katja Kerstin Klaudia Kristin Laura Lea Lena Lisa Mandy Manuela Maria Marie Marina Martina Melanie Monika Nadine Nicole Petra Sabine Sabrina Sandra Sara Silke Simone Sophia Stefanie Susanne Tanja Ulrike Ursula Uta Vanessa Yvonne }
    end    
  end
end
 

# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names
  
    class ScottishFemaleFirst < Name
    
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.rand },
        ]
        @formats_ratiod = [ (0..99) ]
        super
      end
  
      Names = %w{ Aileen Ailie Ailsa Alison Alva Andrina Annabel Arabella Arline Bethia Bonnie Brenda Catriona Cathella Colina Davina Dolina Dona Donaldina Edana Effie Elspeth Ena Fenella Fiona Greer Heather Ina Iona Isla Janet Jean Jinty Kenna Kentigerna Kirsty Lilias Lileas Mairi Mary Marcella Marsali Miriam Muirne Nessa Nessie Osla Rhona Senga Shona }
    end    
  end
end 

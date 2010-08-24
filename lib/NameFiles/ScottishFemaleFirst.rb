module RandomPerson

  class ScottishFemaleFirst < Name
  
    def initialize
      @formats = {
        :single => ->(n)   { n.rand },
       }
       
      @formats_ratiod = [ (0..99) ]
      setupnames
    end

    def setupnames      
      @names = %w{ Aileen Ailie Ailsa Alison Alva Andrina Annabel Arabella Arline Bethia Bonnie Brenda Catriona Cathella Colina Davina Dolina Dona Donaldina Edana Effie Elspeth Ena Fenella Fiona Greer Heather Ina Iona Isla Janet Jean Jinty Kenna Kentigerna Kirsty Lilias Lileas Mairi Mary Marcella Marsali Miriam Muirne Nessa Nessie Osla Rhona Senga Shona }
    end
    
  end
end 
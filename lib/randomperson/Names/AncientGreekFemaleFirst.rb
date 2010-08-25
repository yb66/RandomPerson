module RandomPerson
  module Names

    class AncientGreekFemaleFirst < Name
  
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
         }
         
        @formats_ratiod = [ (0..99) ]
        setupnames
      end
        
      def setupnames
        @names = %w{ Actaia Actoris Aegialeia Aerope Aethra Aethylla Aganippe Aglaia Alcimede Amphinome Anticlea Arne Astynome Astyoche Autolye Callianeira Canache Chione Chloe Circe Clytemnestra Clytie Creusa Cymodece Danae Daphne Deianara Deidameia Dirce Dynamene Eidyia Eriphyle Eurynome Galatea Halia Helen Hesione Hiera Ianassa Iaria Leda Leucippe Limnoraea Maera Mante Meda Melantho Melite Metaneira Nacippe Nemertes Nesaea Orithyia Otionia Panope Penthesilia Periboea Perimede Periopis Pero Pherusa Philomele Polymede Polymele Polypheme Polyxena Prote Protogoria Scarphe Sibyl Speio Tecmessa Thaleia Theano Thoe Xanthippe Xenoclea }
      end
    end    
  end
end


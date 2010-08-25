module RandomPerson
  module Names

    class WelshFemaleFirst < Name
    
      def initialize
        @formats = {
          :single => ->(n)   { n.rand },
         }
         
        @formats_ratiod = [ (0..99) ]
        setupnames
      end
  
      def setupnames      
        @names = %w{ Aberfa Abertha Adain Adara Addfwyn Addiena Adyna Aelwyd Aeron Amser Angharad Anna Annwyl Argel Arglwyddes Argoel Argraff Arial Ariana Arianell Ariene Aranrhod Arianrhod Arianwen Arlais Armes Arthes Arwydd Asgre Auron Avenable Banon Berth Berthog Bethan Blanchfleur Blodeuwedd Blodwen Braith Brandgaine Branwen Bregus Briallen Brisen Bronwen Buddug Brynn Cadwyn Caethes Cafell Canaid Cari Caron Carys Cate Cath Catrin Ceri Ceridwen Cerwen Cigfa Clarisant Cordelia Corsen Cragen Creiddylad Creirwy Cymreiges Daron Dee Del Dera Derwen Deryn Deverell Dicra Dierdre Difyr Dilys Don Druantia Drysi Dwyn Dylis Ebrill Efa Eheubryd Eira Eirianwen Eiriol Elaine Elen Eleri Ellylw Eluned Eneuawy Enfys Enid Enrhydreg Epona Erdudvyl Eres Essyllt Eurneid Eurolwyn Eyslk Ffanci Ffion Fflur Ffraid Gaenor Ganieda Garan Genevieve Gladys Glenna Glenys Glynis Goewin Goleuddydd Gorawen Guinevere Gwaeddan Gwanwyn Gwawr Gwen Gwenda Gwendolyn Gwener Gweneth Gwenhwyfar Gwenledyr Gwenith Gwenllian Gwenn Gwenno Gwerfyl Gwladys Gwyneira Gwyneth Hafgan Hafren Heledd Hellawes Heulwen Heulyn Hywela Idelle Igerna Iola Isolde Jenifer Kelemon Kigva Lilybet Linette Llinos Llio Lowri Lysanor Mab Mabli Mair Maledisant Mali Marged Meghan Melangell Meleri Meredith Meriel Modlen Modron Mon Morfudd Morgan Morgana Morgause Morvudd Morwen Myfanwy Nerys Nesta Neued Nia Nimue Nona Olwen Owena Penarddun Petra Ragnell Rathtyen Rhan Rhawn Rhedyn Rhiamon Rhian Rhiannon Rhianwen Rhonda Rhonwen Rhosyn Rowena Saeth Saffir Sarff Seren Sian Sioned Siwan Taffy Talaith Talar Tanwen Tarian Tarran Tegan Tegau Tegeirian Tegwen Teleri Telyn Terrwyn Toreth Torlan Torri Trevina Tristan Una Vala Vanora Vivian Wenda Winnifred Wynne Ysbail Yseult }
      end
    end    
  end
end


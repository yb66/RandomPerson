# coding: utf-8

module RandomPerson
  module Names

    class WelshMaleFirst < Name
    
      def initialize
        @formats = {
          :single => ->(n)   { n.rand },
         }
         
        @formats_ratiod = [ (0..99) ]
        setupnames
      end
  
      def setupnames      
        @names = %w{ Aberthol Accalon Adda Addolgar Adwr Aedd Aeddan Aglovale Alawn Albanwr Aled Alwyn Amaethon Amerawdwr Amhar Amlawdd Amren Amynedd Andras Andreas Aneirin Anfri Angawdd Angor Anir Anwar Anwas Anwell Anwir Anynnawg Anyon Ap Arawn Ardwyad Arglwydd Arian Arianwyn Arthur Arvel Avagdu Avaon Awstin Baddon Barri Barris Baudwin Beda Bedwyr Bedyw Beli Bellieus Benedigeidfram Bercelak Berth Berwyn Beven Blair Blaise Blathaon Bleddyn Bledri Bleidd Bleiddian Bogart Bors Bowen Brac Brad Bradwen Bradwr Braen Bran Brastias Brathach Brian Brice Broderick Bryn Brys Bwlch Cadarn Caddoc Cadell Cadellin Cadeyrn Cadfael Cadfan Cadman Cadoc Cadwaladr Cadwallen Cadwgawn Cadwr Cadyryeith Caer Caerwyn Cai Cain Cairn Calcas Calder Caledvwich Cant Caradawg Caradoc Carey Carnedyr Cas Casnar Casswallawn Caw Cedric Ceithin Celyn Cerdic Ceri Cerwyn Cian Clud Clust Clyde Cnychwr Coed Colgrevance Collen Colwyn Conwy Corryn Cradelmass Crist Cubert Culhwch Culvanawd Custenhin Cymry Cynan Cynbal Cystennin Dafydd Dagonet Dalldav Daned Davis Deiniol Deverell Dewey Digon Dillan Dillus Dilwyn Dinadan Dirmyg Drem Dremidydd Drew Druce Drudwas Drwst Drych Drystan Duach Dylan Dyvynarth Dyvyr Dywel Earwine Ector Edern Edmyg Ehangwen Eiddoel Eiddyl Eiladar Einion Eiryn Eivyonydd Elis Elphin Emhyr Emlyn Emrys Ennissyen Eoin Erbin Ergyryad Ermid Eryi Eudav Eurosswydd Eus Evan Evnissyen Evrawg Evrei Fercos Fflam Fflergant Fflewdwr Ffodor Ffowc Ffransis Fychan Fyrsil Galahad Galehodin Gamon Gandwy Garanhon Gareth Garnock Garselid Garwyli Garym Gavin Gawain Geraint Gerallt Gerwin Gethin Gilbert Gildas Gilvaethwy Gleis Glendower Glew Glewlwyd Glinyeu Glyn Glythvyr Gobrwy Gofannon Gogyvwlch Goreu Gorlois Gormant Goronwy Gorsedd Govan Govannon Govynyon Gowerr Gowther Granwen Greid Greidyawl Griffin Griffith Griflet Gromer Gronw Gruddyeu Gruffen Guinglain Gusg Gwalchmei Gwalhaved Gwallawg Gwallter Gwarthegydd Gwawl Gwern Gwevyl Gwilym Gwion Gwitart Gwrddywall Gwres Gwyddawg Gwyddno Gwydion Gwydre Gwyglet Gwyn Gwyneira Gwynn Gwyr Gwythyr Hafgan Heddwyn Hefaidd Heilyn Hen Hen Hen Heulfryn Heulyn Howell Huw Hydd Hywel Iago Iau Iddawg Idris Iestyn Ieuan Ifor Inek Iolo Iona Iowerth Irvin Ithel Iustig Jestin Jones Kai Kane Keith Kelli Kelyn Kenn Kent Kenyon Kevyn Kian Kilydd Kim Kynan Kyndrwyn Kynedyr Kynlas Kynon Kynwal Kynwyl Lancelot Lavaine Leodegrance Lionel Llacheu Llara Lleu Llevelys Lloyd Lludd Llwch Llwybyr Llwyd Llwydeu Llwyr Llyn Llyr Llywelyn Lot Lovel Lug Mabon Mabsant Macsen Madawg Maddock Maddox Madoc Mael Maelgwn Maelogan Maelwys Mallolwch Malvern Manawydan March Marrock Math Mawrth Maxen Medyr Meical Melkin Menw Mercher Meredith Merlin Meurig Mil Modred Moesen Mordwywr Morgan Morgannwg Morthwyl Morvran Mostyn Myrddin Naw Neb Nentres Nerth Nerthach Neued Newlin Nissyen Nodens Nynnyaw Odgar Ofydd Ol Olwydd Oswallt Owein Padrig Parry Pasgen Pawl Pedr Peissawg Pelles Pellinore Pellyn Pembroke Penn Pennar Penvro Perceval Peredur Powell Price Pryderi Prydwen Prys Puw Pwyll Pyrs Reese Ren Renfrew Rhain Rheged Rhett Rhionganedd Rhisiart Rhobert Rhodri Rhun Rhuvawn Rhyawdd Rhychdir Rhyd Rhydderch Rhys Robat Romney Sayer Seith Sel Selwyn Selyf Selyv Seren Siam Siarl Siawn Siencyn Sinnoch Sion Sior Steffan Sugyn Sulien Sulyen Syvwlch Tad Taffy Taliesin Tarrant Tegid Tegvan Teilo Teithi Teregud Teryrnon Timotheus Tomos Tor Trahern Trefor Tremayne Trent Trevelyan Tringad Tristan Tristram Tudur Twm Twrgadarn Tywysog Uchdryd Urien Vaddon Vaughn Wadu Waljan Weyland Wmffre Wren Wynn Yale Yestin Ysberin Ysgawyn Yspadaden Pencawr }
      end
    end    
  end
end


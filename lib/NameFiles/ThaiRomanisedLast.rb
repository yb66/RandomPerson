#!/usr/bin/env ruby -wKU

module RandomPerson

  require 'Names'

  class ThaiRomanisedLast
    include Names

    #def names() NAMES; end
    
    def initialize
      @formats = {
        :single =>                      ->(n)   { n.rand },
        :double_barrelled    => ->(n){ n.rand + ' ' + n.rand },
       }
       
      @formats_ratiod = [ (0..49, 50..99) ]
    end
     
    attr_accessor :formats, :formats_ratiod
    
    def execute( person, format=nil )
      if @formats.length > 1
        r = rand(@formats_ratiod.last.end)
        i = @formats_ratiod.index_in_range( r )
        f = @formats.by_index(i).last
      else
        f = @formats[:single]
      end
      Names.execute( NAMES, f )
    end 


    NAMES = %w{ Aromdee Atitarn Bunyasarn Chaiprasit Chaisurivirat Jetatikarn Jetjirawat Juntasa Kadesadayurat Kaewburesai Kaouthai Kasamsun Kitjakarn Kongkatitum Kongpaisarn Kongsangchai Kraiputra Kunakorn Kunchai Kurusarttra Leekpai Leelapun Lertkunakorn Maleenon Maneerattana Meesang Narkbunnum Narkhirunkanok Nimitwanitch Ornlamai Paowsong Parnpradub Parnthong Pornpipatpong Prasongsanti Puntasrima Punyawong Rojjanasukchai Rojumanong Saenamuang Sakda Sangsorn Shinawatra Sirisopa Somchai Somwan Songprawati Sripituksakul Srisati Sriwarunyu Sukbunsung Suntornnitikul Suppamongkon Suttirat Tawisuwan Thumying Tuntayakul Udomprecha Vipavakit Visalyaputra Wattanapanit Wattanasin Yongjaiyut Yuvaves  }
    
    end
end
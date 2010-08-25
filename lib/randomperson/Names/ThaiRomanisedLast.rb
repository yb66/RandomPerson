module RandomPerson
  module Names

    class ThaiRomanisedLast < Name
    
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
          :double_barrelled    => ->(n){ n.rand + ' ' + n.rand },
         }
         
        @formats_ratiod = [ 0..49, 50..99 ]
        setupnames
      end
  
      def setupnames
        @names = %w{ Aromdee Atitarn Bunyasarn Chaiprasit Chaisurivirat Jetatikarn Jetjirawat Juntasa Kadesadayurat Kaewburesai Kaouthai Kasamsun Kitjakarn Kongkatitum Kongpaisarn Kongsangchai Kraiputra Kunakorn Kunchai Kurusarttra Leekpai Leelapun Lertkunakorn Maleenon Maneerattana Meesang Narkbunnum Narkhirunkanok Nimitwanitch Ornlamai Paowsong Parnpradub Parnthong Pornpipatpong Prasongsanti Puntasrima Punyawong Rojjanasukchai Rojumanong Saenamuang Sakda Sangsorn Shinawatra Sirisopa Somchai Somwan Songprawati Sripituksakul Srisati Sriwarunyu Sukbunsung Suntornnitikul Suppamongkon Suttirat Tawisuwan Thumying Tuntayakul Udomprecha Vipavakit Visalyaputra Wattanapanit Wattanasin Yongjaiyut Yuvaves  }
      end
    end    
  end
end
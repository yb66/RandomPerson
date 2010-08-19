#!/usr/bin/env ruby -wKU

module RandomPerson

  require 'Names'

  class ThaiRomanisedMaleFirst
    include Names

    #def names() NAMES; end
    
    def initialize
      @formats = {
        :single =>                      ->(n)   { n.rand },
       }
       
      @formats_ratiod = [ (0..99)]
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


    NAMES = %w{ alak ananda annan anuia anuman anurak badinton baharn bahn bapit baroma bhakdi bhumipol boon-mee boon-nam burimas burut cha chai chairat chaiyanuchit chaiyo chakri chalerm chalermchai changsai chanthara chao-khun-sa chao-tak charoen charoensom charong chatchalerm chatchom chatri chaturon chavalit chesda chomanan chompoo chongrak choochai choonhavan choonhavon chuachai chuanchen chuia chula chulalongkorn chulamai churai chuthamani daeng darin deng dhipyamongkol disnadda ditaka dithakar dok duchanee emjaroen erawan fah fufanwonich gee hainad hanuman intradit ittiporn jaidee jao jarunsuk jatukamramthep jayavarman kamnan kanda karmatha kasem kasemchai kasemsan keetau khakanang khun kiet kit kitti kittibun kittichai kittichat kittikchorn kob komalat kongsampong korn kovit kraisee kraisingha krarayoon kriengsak kris krita krom-luang kukrit kusa kwanchai kwanjai lamom lamon lap leekpai leekpie lek loesan luk maha mahidol malian manitho mee mengrai metananda mok mokkhavesa mongkut monyakul muoi nadee nai-thim nak nang-klao narai naresuan naris narisa net ngam nikom nikon nintau niran nit noi nongchai noppadon norachai nuananong nui nung nuta-laya obb othong pairat paitoon pakhdi palat panyarachun paramendr parnchand pattama pet petchara petchra phaibun phara phinihan phraisong phrom-borirak phya pichai pichit pira pra prachuab pramoj prasong pravat praves praya pricha prisna proi pu rachotai rak ramkamhaeng rangsan ratanankorn ratsami sajja sanouk santichai sanun sap sarawong sarit sataheep satrud sawat seni si siam sinn sombat somchai somdet-ong-yai somdetch sompron son songgram soo sook sophuk sri srimuang su suda sudarak suk sulak sum sumatra sunan sundaravej suntarankul sunti sup suphatra suphayok supoj supp supsampantuwongse suriwongse suriyawong sutep tai tak-sin tam tau tep tham-boon thammaraja thanarat thanit thawanya thawi thongkon thurdchai ti tiloka ting tinsulaananda tinsulanonda ton tong totsakan toy ubol udom unakan vajiralongkorn vajiravudh vessandan vidura wasi wattana wiset witsanunat wongsa xuwicha yai yhukon yindee yod yongchaiyudh yongchaiyuth yubamrung }
    
    end
end
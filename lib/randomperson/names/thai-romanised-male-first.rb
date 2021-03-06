# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names

    class ThaiRomanisedMaleFirst < Name
      
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.sample },
        ]
        @formats_ratiod = [ (0..99)]
        super
      end
  
      # @private            
      Names = %w{ Alak Ananda Annan Anuia Anuman Anurak Badinton Baharn Bahn Bapit Baroma Bhakdi Bhumipol Boon-Mee Boon-Nam Burimas Burut Cha Chai Chairat Chaiyanuchit Chaiyo Chakri Chalerm Chalermchai Changsai Chanthara Chao-Khun-Sa Chao-Tak Charoen Charoensom Charong Chatchalerm Chatchom Chatri Chaturon Chavalit Chesda Chomanan Chompoo Chongrak Choochai Choonhavan Choonhavon Chuachai Chuanchen Chuia Chula Chulalongkorn Chulamai Churai Chuthamani Daeng Darin Deng Dhipyamongkol Disnadda Ditaka Dithakar Dok Duchanee Emjaroen Erawan Fah Fufanwonich Gee Hainad Hanuman Intradit Ittiporn Jaidee Jao Jarunsuk Jatukamramthep Jayavarman Kamnan Kanda Karmatha Kasem Kasemchai Kasemsan Keetau Khakanang Khun Kiet Kit Kitti Kittibun Kittichai Kittichat Kittikchorn Kob Komalat Kongsampong Korn Kovit Kraisee Kraisingha Krarayoon Kriengsak Kris Krita Krom-Luang Kukrit Kusa Kwanchai Kwanjai Lamom Lamon Lap Leekpai Leekpie Lek Loesan Luk Maha Mahidol Malian Manitho Mee Mengrai Metananda Mok Mokkhavesa Mongkut Monyakul Muoi Nadee Nai-Thim Nak Nang-Klao Narai Naresuan Naris Narisa Net Ngam Nikom Nikon Nintau Niran Nit Noi Nongchai Noppadon Norachai Nuananong Nui Nung Nuta-Laya Obb Othong Pairat Paitoon Pakhdi Palat Panyarachun Paramendr Parnchand Pattama Pet Petchara Petchra Phaibun Phara Phinihan Phraisong Phrom-Borirak Phya Pichai Pichit Pira Pra Prachuab Pramoj Prasong Pravat Praves Praya Pricha Prisna Proi Pu Rachotai Rak Ramkamhaeng Rangsan Ratanankorn Ratsami Sajja Sanouk Santichai Sanun Sap Sarawong Sarit Sataheep Satrud Sawat Seni Si Siam Sinn Sombat Somchai Somdet-Ong-Yai Somdetch Sompron Son Songgram Soo Sook Sophuk Sri Srimuang Su Suda Sudarak Suk Sulak Sum Sumatra Sunan Sundaravej Suntarankul Sunti Sup Suphatra Suphayok Supoj Supp Supsampantuwongse Suriwongse Suriyawong Sutep Tai Tak-Sin Tam Tau Tep Tham-Boon Thammaraja Thanarat Thanit Thawanya Thawi Thongkon Thurdchai Ti Tiloka Ting Tinsulaananda Tinsulanonda Ton Tong Totsakan Toy Ubol Udom Unakan Vajiralongkorn Vajiravudh Vessandan Vidura Wasi Wattana Wiset Witsanunat Wongsa Xuwicha Yai Yhukon Yindee Yod Yongchaiyudh Yongchaiyuth Yubamrung }
    end    
  end
end

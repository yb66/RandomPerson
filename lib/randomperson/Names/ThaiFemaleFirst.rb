# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names
  
    class ThaiFemaleFirst < Name
      
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.rand },
        ]
        @formats_ratiod = [ (0..99)]
        super
      end
       
  
      Names = %w{ สิริกิติ์ กานดา แก้วเก้า ขจี ขวัญใจ ชนิภรณ์ ฐิติภรณ์ ณี ดวงกมล เดือนเพ็ญ นงนุช นภสร นริศา นัยนา นาก นีราชา บุญศรี บุษราคัม พรพรรณ พรพันธ์ พรพันธุ์ พรรณี อมรรัตน์ อุบล หทัย หนิว สุริยา สุรี ศศิธร ศิริพร ศิริวรรณ สมร สังวาล สายสมร สุดา สุนีย์ รัตน์ รินรดา รื่นฤดี ฤดี ฤทัย ภรณ์พรรณ ภรณ์พันธ์ ภรณ์พันธุ์ มณี มาลี กนกพร กมล กฤษฏิ์ กาญจนา กุญชนิตา กุมโชค กุลพันธ์ เกษม ขนิษฐา ขวัญจิต จันทร์สิริ จารุวรรณ จุลภาส เจือ ฉลวย เฉลิม ชนะ ชนินทร์ คลัง จตุพล ชมเกดุ ชวน ชัยพร ชาติชาย ชิด ชุ่ม ชูวิทย์ เซติยัง เซติอาวัน ญาณิน ฐิตวรรณ ณรงค์ศักดิ์ ณัฎฐา ณัฐิมา ดวงใจ แดง ตนุพล ถนัด ถวิล ทวีฉัตร ทวีป ทวีวงศ์ ทวีศักดิ์ ทักษิณ ทัศนีย์ ธงชัย ธนากร ธีรภัทร ธีรศักดิ์ นงลักษณ์ นพรัตน์ นฤมล นาค นิตยา เนาวรัตน์ บัญญัติ บัณฑิตา บุญยง บุญเยี่ยม บุญรัตน์ บุศวรรณ ปฏิภาณ ปฐม ประชา ประดิษฐ์ ประทีป ประทุม ประภาส ประมนต์ ประมุข ประวิตร ประเวช ประเวศ ประสาน ปรัชญา ปราณี ปริญญา ป้อง ปานใจ ปานเทพ ปาริชาติ ปิยบุตร ปิยวรรณ ปิยะคม ปีย์รติ ผ่องเพ็ญ ผาณิต เผด็จ พนม พยนต์ พรชัย พรรัมภา พลเดช พัชรพร พัฒนา พาณิชย์ พาที พิจิตร พิชิต พินิจ พิภพ พิมพ์ใจ พิมพ์วสี พิริยะ พูนศักดิ์ เพ็ญสุขภรณ์ เพิ่ม ไพฑูรย์ ไพบูลย์ ไพรัช ไพศักดิ์ ไพศาล ภานุพัฒน์ ภาสุระ ภิรมย์ ภุชงค์ ภูมินทร์ ภูมิพัฒน์ มงคล มนตรี มโน มานิจ มานิตย์ มารวย มุกดา ยิ่งยศ ยุพิน ยุวรัตน์ รื่น รุ่งสิทธิ์ วรพร วรภัทร วราภรณ์ วัชราภรณ์ วัฒนา วัลลภ วัลลภา วิจารณ์ วิจิตร วิเชียร วิทยา วิโรจน์ วิลาศ วิเศษ วีรยุทธ์ วีรศักดิ์ วีระชาติ วีระชาย วีระพล วีระพันธุ์ วีระศักดิ์ ศรีศักดิ์ ศักดา ศักดิ์ทิพย์ ศิริโชค ศิริณี ศิริพงศ์ ศิริพล ศิริรัตน์ ศุภผล ศุภรัตน์ ศุภวิทย์ สกุล สนั่น สนิท สมควร สมคิด สมชาย สมโชค สมทรง สมบัติ สมบุญ สมพงษ์ สมพร สมเพียร สมภพ สมยศ สมรัตน์ สมลักษณ์ สมศรี สมศักดิ์ สมหมาย สมัคร สริตา สลิลธร สวัสดิ์ สว่าง สันติ สากล สาธิต สาธิตยัง สามารถ สายพิณ สาวิทย์ สิงห์ สิทธิ สิริรักษ์ สีห์ศักดิ์ สุกัญญา สุจิต สุจินดา สุชาดา สุชาดาจะ สุชาติ สุชาย สุทธิพงศ์ สุทธิพล สุเทพ สุธรรม สุนทรี สุนัย สุนี สุประภา สุพรรณ สุพิชา สุภาพ สุภาภรณ์ สุรัตน์ สุริยะ สุวรรณ สุวิชา สุหัตถ์ เสรี อดิศักดิ์ อนันต์ อภิชาต อภิชาติ อภิญญา อภิรักษ์ อภิศักดิ์ อริศรา อรุณศรี อัญญาณี อัษรา อาณัติ อารง อารีพงศ์ อุบลวรรณ เอกพงษ์ เอกใหม่ }
      
    end      
  end
end




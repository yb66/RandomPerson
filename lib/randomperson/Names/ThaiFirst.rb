# coding: utf-8

module RandomPerson
  module Names
  
    class ThaiFirst < Name
      
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
         }
         
        @formats_ratiod = [ (0..99)]
        setupnames
      end
       
  
      def setupnames
        @names = %w{ กมล กาญจนา เกษม จารุวรรณ ดวงใจ ถนอม ทัศนีย์ ธงชัย ธิดา ณรงค์ นงลักษณ์ นพดล นฤมล นิตยา บัญชา ประจักษ์ ประชา ประทุม ปัญญา ปราณี ปรีชา พรชัย พรรณี ไพบูลย์ ไพโรจน์ มนตรี มานะ มานิตย์ มาลี ยุพิน รัชนี รัตนา วัฒนา วราภรณ์ วาสนา วิเชียร วินัย วิโรจน์ ศศิธร ศิริพร สมชาย สมทรง สมพร สมหมาย สมศรี สำราญ สุกัญญา สุชาดา สุชาติ สุเทพ สุนีย์ สุภาภรณ์ อนงค์ อนันต์	  }
      end  
    end      
  end
end

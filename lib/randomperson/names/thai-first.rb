# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names
  
    class ThaiFirst < Name
      
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.sample },
        ]
        @formats_ratiod = [ (0..99)]
        super
      end
       
  
      # @private            
      Names = %w{ กมล กาญจนา เกษม จารุวรรณ ดวงใจ ถนอม ทัศนีย์ ธงชัย ธิดา ณรงค์ นงลักษณ์ นพดล นฤมล นิตยา บัญชา ประจักษ์ ประชา ประทุม ปัญญา ปราณี ปรีชา พรชัย พรรณี ไพบูลย์ ไพโรจน์ มนตรี มานะ มานิตย์ มาลี ยุพิน รัชนี รัตนา วัฒนา วราภรณ์ วาสนา วิเชียร วินัย วิโรจน์ ศศิธร ศิริพร สมชาย สมทรง สมพร สมหมาย สมศรี สำราญ สุกัญญา สุชาดา สุชาติ สุเทพ สุนีย์ สุภาภรณ์ อนงค์ อนันต์	  }
    end      
  end
end


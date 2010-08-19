#!/usr/bin/env ruby -wKU
# coding: utf-8

module RandomPerson

  require 'Names'

  class ThaiFirst
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


    NAMES = %w{ กมล กาญจนา เกษม จารุวรรณ ดวงใจ ถนอม ทัศนีย์ ธงชัย ธิดา ณรงค์ นงลักษณ์ นพดล นฤมล นิตยา บัญชา ประจักษ์ ประชา ประทุม ปัญญา ปราณี ปรีชา พรชัย พรรณี ไพบูลย์ ไพโรจน์ มนตรี มานะ มานิตย์ มาลี ยุพิน รัชนี รัตนา วัฒนา วราภรณ์ วาสนา วิเชียร วินัย วิโรจน์ ศศิธร ศิริพร สมชาย สมทรง สมพร สมหมาย สมศรี สำราญ สุกัญญา สุชาดา สุชาติ สุเทพ สุนีย์ สุภาภรณ์ อนงค์ อนันต์	  }
    
    end
end


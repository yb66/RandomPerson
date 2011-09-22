# encoding: UTF-8

module RandomPerson

  class Name
    
    attr_accessor :formats, :formats_ratiod, :names, :possibles

    def initialize
      unless @formats_ratiod.nil? && @formats.nil?
        @possibles = Hash[ @formats_ratiod.zip @formats ]
      end
    end

    def execute( person=nil )
      f = if @formats.length > 1
        r = rand(@formats_ratiod.last.end + 1)
        @possibles.each_pair{|k,v| break v if k === r }
      else
        @possibles.first.last #throw away the key name
      end
      f.( @names )
    end 
  
  end
  
end

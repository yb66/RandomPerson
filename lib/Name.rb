#!/usr/bin/env ruby -wKU

module RandomPerson

  class Name
    
    attr_accessor :formats, :formats_ratiod, :names

    def execute( person=nil )
      if @formats.length > 1
        r = rand(@formats_ratiod.last.end)
        i = @formats_ratiod.index_in_range( r )
        f = @formats.by_index(i).last
      else
        f = @formats[:single]
      end
      f.( @names )
    end 
  
  end
  
end
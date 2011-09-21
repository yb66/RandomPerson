# encoding: UTF-8

require_relative "./ext/Hash.rb"

module RandomPerson

  class Name
    
    attr_accessor :formats, :formats_ratiod, :names

    def execute( person=nil )
      if @formats.length > 1
        r = rand(@formats_ratiod.last.end + 1)
        i = @formats_ratiod.index_in_range( r )
        f = @formats[i]
      else
        f = @formats.first #throw away the key name
      end
      f.( @names )
    end 
  
  end
  
end

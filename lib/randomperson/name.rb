# encoding: UTF-8

require_relative "./ext/Hash.rb"

module RandomPerson

  class Name
    
    attr_accessor :formats, :formats_ratiod, :names

    def execute( person=nil )
      if @formats.length > 1
        r = rand(@formats_ratiod.last.end)
        i = @formats_ratiod.index_in_range( r )
        f = @formats.by_index(i).last
      else
        k, f = @formats.first #throw away the key name
      end
      f.( @names )
    end 
  
  end
  
end

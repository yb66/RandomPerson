module RandomPerson

  require 'Names'

  class CommonFormatsFirstName
    include Names

    #def names() NAMES; end
    
    def initialize
      @formats = {
        :single =>                      ->(n)   { n.rand },
       }
       
      @formats_ratiod = [ (0..99)]
    end
     
    attr_accessor :formats, :formats_ratiod
    
    def execute( person, format=nil, names  )
      if format.nil?
        if @formats.length > 1
          r = rand(@formats_ratiod.last.end)
          i = @formats_ratiod.index_in_range( r )
          f = @formats.by_index(i).last
        else
          f = @formats[:single]
        end
      else
        f = format
      end
      format = ->(n){ n.rand } if format.nil?
      # puts format.inspect
      format.( names )
    end 
    
  end
end
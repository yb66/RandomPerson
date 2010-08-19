#!/usr/bin/env ruby -wKU

module RandomPerson

  require 'Names'

  class EnglishLast
    include Names

    #def names() NAMES; end
    
    def initialize
      @formats = {
        :single =>                      ->(n)   { n.rand },
        :double_barrelled_hyphenated=> ->(n)   { n.rand + '-' + n.rand },
       }
       
      @formats_ratiod = [ (0..96), (97..99) ]
    end
     
    attr_accessor :formats, :formats_ratiod
    
    def execute( person, format=nil )
      r = rand(@formats_ratiod.last.end)
      i = @formats_ratiod.index_in_range( r )
      Names.execute( NAMES, @formats.by_index(i)   )
    end 


    NAMES = %w{ Smith Johnson Williams Jones Brown Davis Miller Wilson Moore Taylor Anderson Thomas Jackson White Harris Martin Thompson Garcia Martinez Robinson Clark Rodriguez Lewis Lee Walker Hall Allen Young Hernandez King Wright Lopez Hill Scott Green Adams Baker Gonzalez Nelson Carter Mitchell Perez Roberts Turner Phillips Campbell Parker Evans Edwards Collins Stewart Sanchez Morris Rogers Reed Cook Morgan Bell Murphy Bailey Rivera Cooper Richardson Cox Howard Ward Torres Peterson Gray Ramirez James Watson Brooks Kelly Sanders Price Bennett Wood Barnes Ross Henderson Coleman Jenkins Perry Powell Long Patterson Hughes Flores Washington Butler Simmons Foster Gonzales Bryant Alexander Russell Griffin Diaz Hayes }

  end
end
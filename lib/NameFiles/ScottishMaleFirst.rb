#!/usr/bin/env ruby -wKU

module RandomPerson

  class ScottishMaleFirst < Name
  
    def initialize
      @formats = {
        :single => ->(n)   { n.rand },
       }
       
      @formats_ratiod = [ (0..99) ]
      setupnames
    end

    def setupnames      
      @names = %w{ Alastair Alexander Alpin Angus Aulay Blane Boyd Calum Clyde Coll David Donald Donnan Dougal Douglas Duff Duncan Ewan Farquar Fingal Finlay Fraser Gavin Gillian Gillis Gordon Greer Hamish Ian Iain Ivar Kenneth Kirk Kyle Lachlan Lorne Malcolm Mirren Mungo Neil Neal Ranald Rory Ross Sholto Somerled Tavish Torquil Wallace }
    end
    
  end
end 
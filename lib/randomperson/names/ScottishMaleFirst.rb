# encoding: UTF-8

require_relative "../name.rb"

module RandomPerson
  module Names
  
    class ScottishMaleFirst < Name

      Names = %w{ Alastair Alexander Alpin Angus Aulay Blane Boyd Calum Clyde Coll David Donald Donnan Dougal Douglas Duff Duncan Ewan Farquar Fingal Finlay Fraser Gavin Gillian Gillis Gordon Greer Hamish Ian Iain Ivar Kenneth Kirk Kyle Lachlan Lorne Malcolm Mirren Mungo Neil Neal Ranald Rory Ross Sholto Somerled Tavish Torquil Wallace }
    
      def initialize
        @names = Names
        @formats = [ ->(n){ n.rand } ]
        @formats_ratiod = [ (0..99) ]

        super
      end

    end # class
  end # Names
end # RandomPerson
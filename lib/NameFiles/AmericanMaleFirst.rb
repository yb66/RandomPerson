#!/usr/bin/env ruby -wKU

module RandomPerson

  class AmericanMaleFirst < Name

    def initialize
      @formats = {
        :single =>                      ->(n)   { n.rand },
       }
       
      @formats_ratiod = [ (0..99) ]
      setupnames
    end
      
    def setupnames
      @names = %w{ Aaron Adam Adrian Alan Alejandro Alex Allen Andrew Andy Anthony Art Arthur Barry Bart Ben Benjamin Bill Bobby Brad Bradley Brendan Brett Brian Bruce Bryan Carlos Chad Charles Chris Christopher Chuck Clay Corey Craig Dan Daniel Darren Dave David Dean Dennis Denny Derek Don Doug Duane Edward Eric Eugene Evan Frank Fred Gary Gene George Gordon Greg Harry Henry Hunter Ivan Jack James Jamie Jason Jay Jeff Jeffrey Jeremy Jim Joe Joel John Jonathan Joseph Justin Keith Ken Kevin Larry Logan Marc Mark Matt Matthew Michael Mike Nat Nathan Patrick Paul Perry Peter Philip Phillip Randy Raymond Ricardo Richard Rick Rob Robert Rod Roger Ross Ruben Russell Ryan Sam Scot Scott Sean Shaun Stephen Steve Steven Stewart Stuart Ted Thomas Tim Toby Todd Tom Troy Victor Wade Walter Wayne William }
    end
    
  end
end
#!/usr/bin/env ruby -wKU

module RandomPerson

  require 'Names'

  class AmericanMaleFirst
    include Names

    def execute( person, &format )
      Names.execute( person, NAMES )
    end 
      
#     def names( ) NAMES; end

    NAMES = %w{ aaron adam adrian alan alejandro alex allen andrew andy anthony art arthur barry bart ben benjamin bill bobby brad bradley brendan brett brian bruce bryan carlos chad charles chris christopher chuck clay corey craig dan daniel darren dave david dean dennis denny derek don doug duane edward eric eugene evan frank fred gary gene george gordon greg harry henry hunter ivan jack james jamie jason jay jeff jeffrey jeremy jim joe joel john jonathan joseph justin keith ken kevin larry logan marc mark matt matthew michael mike nat nathan patrick paul perry peter philip phillip randy raymond ricardo richard rick rob robert rod roger ross ruben russell ryan sam scot scott sean shaun stephen steve steven stewart stuart ted thomas tim toby todd tom troy victor wade walter wayne william }
      
#     FORMATS = {
#       :single =>                      ->(n)   { n.rand }
#     }
    

#       format = FORMATS[:single] if format.nil?
#       # puts format.inspect
#       # format.( @NAMES )
#       NAMES.rand
#     end
    
    
  end
end
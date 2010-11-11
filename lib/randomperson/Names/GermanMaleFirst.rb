# coding: utf-8

module RandomPerson
  module Names

    class GermanMaleFirst < Name
  
      def initialize
        @formats = {
          :single =>                      ->(n)   { n.rand },
         }
         
        @formats_ratiod = [ (0..99) ]
        setupnames
      end
        
      def setupnames
        @names = %w{ Alexander Andreas Benjamin Bernd Christian Daniel David Dennis Dieter Dirk Dominik Eric Felix Florian Frank Jan Jens Jonas Jörg Jürgen Kevin Klaus Kristian Leon Lukas Marcel Marco Mario Markus Martin Mathias Max Maximilian Michael Mike Niklas Patrick Paul Peter Philipp Ralf René Robert Sebastian Stefan Steffen Sven Thomas Thorsten Tim Tobias Tom Ulrich Uwe Wolfgang }
      end
    end    
  end
end
 
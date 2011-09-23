# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class GermanMaleFirst < Name
  
      def initialize
        @names = Names
        @formats = [
          ->(n)   { n.rand },
        ]
        @formats_ratiod = [ (0..99) ]
        super 
      end
        
      Names = %w{ Alexander Andreas Benjamin Bernd Christian Daniel David Dennis Dieter Dirk Dominik Eric Felix Florian Frank Jan Jens Jonas Jörg Jürgen Kevin Klaus Kristian Leon Lukas Marcel Marco Mario Markus Martin Mathias Max Maximilian Michael Mike Niklas Patrick Paul Peter Philipp Ralf René Robert Sebastian Stefan Steffen Sven Thomas Thorsten Tim Tobias Tom Ulrich Uwe Wolfgang }
    end    
  end
end
 

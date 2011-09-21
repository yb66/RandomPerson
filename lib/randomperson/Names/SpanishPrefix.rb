# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class SpanishPrefix < Name
            
      def initialize
         
        @formats = {
          single: ->(n) { n.rand }
        }
        @formats_ratiod = [ 0..48, 49..49, 50..50, 51..74, 75..99]
        
        @names          = ["Sr.", "Dr.", "Dra.", "Sra.", "Srta."] 
      end
      
      def execute( person )
        name = if person.age < 17
          person.gender == 'f' ? "Srta." : "Sr." 
        else
          r = rand(50) #0..99
          r += 50 if person.gender == "f"
          i = @formats_ratiod.index_in_range( r )
          puts "r: #{r} i: #{i}"
          @names[i]
        end
        
        name
      end

    end # class
  end # Names
end # RandomPerson

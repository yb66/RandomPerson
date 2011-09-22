# encoding: UTF-8

require_relative "../name.rb"
require_relative "../ext/Array.rb"

module RandomPerson
  module Names

    class SpanishPrefix < Name
            
      Names          = ["Sr.", "Dr.", "Dra.", "Sra.", "Srta."] 

      # the way this class is set up is different than usual
      # it's all just a shortcut, but it works
      def initialize
        @names = Names         
        @formats = [ nil ]
        @formats_ratiod = [ 0..48, 49..49, 50..50, 51..74, 75..99]
        @possibles = Hash[ @formats_ratiod.zip @names ]
      end
      
      def execute( person )
        name = if person.age < 17
          person.gender == 'f' ? "Srta." : "Sr." 
        else
          r = rand(50) #0..99
          r += 50 if person.gender == "f"
          @possibles.each_pair{|k,v| break v if k === r }
        end
        
        name
      end

    end # class
  end # Names
end # RandomPerson

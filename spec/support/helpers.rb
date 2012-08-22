# encoding: UTF-8

module RandomPerson
  module Spec

    module Helpers

      def all_kind_of?( collection, kind )
        collection.all? {|c| c.kind_of? kind }
      end

      Word = /\b\p{Upper}\p{Alpha}+?\b (?:(?:\s|-)\b\p{Upper}\p{Alpha}+?\b)?/x
      Hypenated_rgx = /^#{Word}$/x 
      French_rgx = /^(?:(?: (?:\bLe\b\s) | (?:\bd[eu]\b)\s) | (?:#{Word}-))? #{Word}$/x
      Hypenated_many_rgx = /^#{Word} (?:(?:\s|-)#{Word})*$/x
      Unhypenated_rgx = /^#{Word}\s#{Word}?$/x 
      Poss_unhyph = /^#{Word}(?:\s#{Word})?$/
      Thai_style = /^\b\p{Graph}+?\b$/x
      Default_fix = {times: 50 } 
      
      def self.fixtures
        if @fixtures.nil?
          @fixtures = {}
          @fixtures.default = Default_fix
          @fixtures["SpanishLast"] = Default_fix.merge({ rgx: /^ \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?: (?:\bde\b\s) | (?: \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?:\by\b\s)? ) )? \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b$/x })
          @fixtures["AmericanLast"] = Default_fix.merge({ rgx: Hypenated_rgx } )
          @fixtures["AnyLast"] = Default_fix.merge({ rgx: Hypenated_rgx  } )
          @fixtures["BritishLast"] = Default_fix.merge({ rgx: Hypenated_rgx  } )
          @fixtures["EnglishLast"] = Default_fix.merge({ rgx: Hypenated_rgx  } )
          @fixtures["ScottishLast"] = Default_fix.merge({ rgx: Hypenated_rgx  } )
          @fixtures["WelshLast"] = Default_fix.merge({ rgx: Poss_unhyph  } )
          @fixtures["FrenchLast"] = Default_fix.merge({ rgx: French_rgx} )
          @fixtures["FrenchFemaleFirst"] = Default_fix.merge({ rgx: Hypenated_rgx  } )
          @fixtures["FrenchMaleFirst"] = Default_fix.merge({ rgx: Hypenated_rgx  } )
          @fixtures["BasqueMaleFirst"] = Default_fix.merge({ rgx: Hypenated_rgx  } )
          @fixtures["BasqueLast"] = Default_fix.merge({ rgx: Unhypenated_rgx  } )
          @fixtures["ThaiRomanisedLast"] = Default_fix.merge({ rgx: Hypenated_rgx  } )
          @fixtures["ThaiFemaleFirst"] = Default_fix.merge({ rgx: Thai_style } )
          @fixtures["ThaiMaleFirst"] = Default_fix.merge({ rgx: Thai_style} )
          @fixtures["ThaiLast"] = Default_fix.merge({ rgx: Thai_style} )
          @fixtures["ThaiFirst"] = Default_fix.merge({ rgx: Thai_style} )
          @fixtures["ThaiRomanisedMaleFirst"] = Default_fix.merge({ rgx: Hypenated_many_rgx} )
          @fixtures["ThaiRomanisedFemaleFirst"] = Default_fix.merge({ rgx: Hypenated_many_rgx} )
          @fixtures["AncientGreekLast"] = Default_fix.merge(
            { rgx: /^\bof\b\s(?:\b\p{Alpha}+?\b(?:\s|-)){0,3}\b\p{Alpha}+?\b$/x } )
        end
        @fixtures
      end
      
      # prefixes
      def self.fix_fixtures
        if @fix_fixtures.nil?
          @fix_fixtures = {}
          @fix_fixtures["FinnishPrefix"] = {
            young_male: {gender: "m", age: rand(17), in: ["herra"]}, #rgx: /^\bherra\b$/x },
            older_male: {gender: "m", in: ["herra", "Dr"]}, #rgx: /^\b(?:herra|Dr)\b$/x },
            young_female: {gender: "f", age: rand(17), in: ["neiti"]}, #rgx: /^\bneiti\b$/x },
            older_female: {gender: "f", age: rand(17), in: ["rouva", "neiti", "Dr"]} #rgx: /^\b(?:rouva)|(?:neiti)|(?:Dr)\b$/x },
          }
          @fix_fixtures["SpanishPrefix"] = {
            young_male: {gender: "m", age: rand(17), in: ["Sr."]}, #rgx: /^\bSr\b\.$/x },
            older_male: {gender: "m", in: ["Sr.", "Dr."]}, #rgx: /^\b(?:[SD]r\b\.)$/x },
            young_female: {gender: "f", age: rand(17), in: ["Srta."]}, #rgx: /^\bSrta\b.$/x },
            older_female: {gender: "f", in: ["Dra.", "Srta.", "Sra."]}#rgx: /^[DS]rt?a\b\.$/x }
          }
          @fix_fixtures["AmericanPrefix"] = {
            young_female: {gender: "f", age: rand(17), rgx: /^\bMiss\b$/},
            older_female: {gender: "f", in: ["Miss", "Mrs.", "Dr.", "Ms."]}, #rgx: /^\bM(?:(?:iss\b)|(?:(?:r?s)\b\.))$|(?:Dr\b\.$)/x },
            young_male: {gender: "m", age: rand(17), in: ["Mr."]}, #rgx: /^\bMr\b\.$/},
            older_male:  {gender: "m", in: ["Mr.", "Dr."]}, 
          } #rgx: /^\b[MD]r\b\.$/}, }
          @fix_fixtures["AmericanSuffix"] = {
            young_female: {},
            older_female: {},
            young_male: {},
            older_male:  {} }
          @fix_fixtures["BritishPrefix"] = {
            young_female: {gender: "f", age: rand(17), rgx: /^\bMiss\b$/},
            older_female: {gender: "f", rgx: /^\b(?:M(?:is|r)?s)|(?:Dr)\b$/},
            young_male: {gender: "m", age: rand(17), rgx: /^\bMr\b$/},
            older_male:  {gender: "m", rgx: /^\b[MD]r\b$/}, }
          @fix_fixtures["EnglishPrefix"] = @fix_fixtures["ScottishPrefix"] = @fix_fixtures["WelshPrefix"] = @fix_fixtures["BritishPrefix"]
  
    #SUFFIXES
          @fix_fixtures["BritishSuffix"] = {
            young_female: {age: rand(17), gender: "f", in: [""] },
            older_female: { gender: "f", in: %w( OBE MBE GBE KBE DBE CBE JP GM PhD BSc BA )}, 
            young_male: {age: rand(17), gender: "m", in: [""] },
            older_male: {gender: "m", in: %w( OBE MBE GBE KBE DBE CBE JP GM PhD BSc BA ) }, 
          }
          @fix_fixtures["AmericanSuffix"] = { # strictly speaking, gender doesn't matter here, but I'll leave the test in.
            young_female: {age: rand(17), gender: "f", in: [ 'Jr.', ''] + %w( I II III IV V) },
            young_male: { age: rand(17), gender: "m", in: [ 'Jr.', ''] + %w( I II III IV V ) },
            older_male: { gender: "m", in: [ ''] + %w( I II III IV V Sr. ) },
            older_female: { gender: "f", in: [ ''] + %w( I II III IV V Sr. ) }, 
          }
        end
        @fix_fixtures
      end

    end # Helpers
  end # Spec
end # RandomPerson

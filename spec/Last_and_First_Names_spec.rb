# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/person.rb"
require_relative "../lib/randomperson/demographic.rb"

module RandomPerson
  module Names
    
    available_classes = Demographic.load_names
    available_classes.each do |klass|
      klass = Demographic.requiring klass
      
      k = eval "RandomPerson::Names::#{klass}"
      
        

      hyph = /\b\p{Upper}\p{Alpha}+?\b (?:(?:\s|-)\b\p{Upper}\p{Alpha}+?\b)?/x
      hypenated_rgx = /^#{hyph}$/x 
      french_rgx = /^(?:(?: (?:\bLe\b\s) | (?:\bd[eu]\b)\s) | (?:\b\p{Upper}\p{Alpha}+?\b-))? #{hyph}$/x
      hypenated_many_rgx = /^\b\p{Upper}\p{Alpha}+?\b (?:(?:\s|-)\b\p{Upper}\p{Alpha}+?\b)*$/x
      unhypenated_rgx = /^\b\p{Upper}\p{Alpha}+?\b\s\b\p{Upper}\p{Alpha}+?\b?$/x 
      thai_style = /^\b\p{Graph}+?\b$/x
      default_fix = {times: 50 } 
      fixtures = {}
      fixtures.default = default_fix
      fixtures["SpanishLast"] = default_fix.merge({ rgx: /^ \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?: (?:\bde\b\s) | (?: \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?:\by\b\s)? ) )? \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b$/x })
      fixtures["AmericanLast"] = default_fix.merge({ rgx: hypenated_rgx } )
      fixtures["AnyLast"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["BritishLast"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["EnglishLast"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["FrenchLast"] = default_fix.merge({ rgx: french_rgx} )
      fixtures["FrenchFemaleFirst"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["FrenchMaleFirst"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["BasqueMaleFirst"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["BasqueLast"] = default_fix.merge({ rgx: unhypenated_rgx  } )
      fixtures["ThaiRomanisedLast"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["ThaiFemaleFirst"] = default_fix.merge({ rgx: thai_style } )
      fixtures["ThaiMaleFirst"] = default_fix.merge({ rgx: thai_style} )
      fixtures["ThaiLast"] = default_fix.merge({ rgx: thai_style} )
      fixtures["ThaiFirst"] = default_fix.merge({ rgx: thai_style} )
      fixtures["ThaiRomanisedMaleFirst"] = default_fix.merge({ rgx: hypenated_many_rgx} )
      fixtures["ThaiRomanisedFemaleFirst"] = default_fix.merge({ rgx: hypenated_many_rgx} )
      fixtures["AncientGreekLast"] = default_fix.merge(
        { rgx: /^\bof\b\s(?:\b\p{Alpha}+?\b(?:\s|-)){0,2}\b\p{Alpha}+?\b$/x } )
      
#PREFIXES
      fix_fixtures = {}
      fix_fixtures["FinnishPrefix"] = {
        young_male: {gender: "m", age: rand(17), in: ["herra"]}, #rgx: /^\bherra\b$/x },
        older_male: {gender: "m", in: ["herra", "Dr"]}, #rgx: /^\b(?:herra|Dr)\b$/x },
        young_female: {gender: "f", age: rand(17), in: ["neiti"]}, #rgx: /^\bneiti\b$/x },
        older_female: {gender: "f", age: rand(17), in: ["rouva", "neiti", "Dr"]} #rgx: /^\b(?:rouva)|(?:neiti)|(?:Dr)\b$/x },
      }
      fix_fixtures["SpanishPrefix"] = {
        young_male: {gender: "m", age: rand(17), in: ["Sr."]}, #rgx: /^\bSr\b\.$/x },
        older_male: {gender: "m", in: ["Sr.", "Dr."]}, #rgx: /^\b(?:[SD]r\b\.)$/x },
        young_female: {gender: "f", age: rand(17), in: ["Srta."]}, #rgx: /^\bSrta\b.$/x },
        older_female: {gender: "f", in: ["Dra.", "Srta.", "Sra."]}#rgx: /^[DS]rt?a\b\.$/x }
      }
      fix_fixtures["AmericanPrefix"] = {
        young_female: {gender: "f", age: rand(17), rgx: /^\bMiss\b$/},
        older_female: {gender: "f", in: ["Miss", "Mrs.", "Dr.", "Ms."]}, #rgx: /^\bM(?:(?:iss\b)|(?:(?:r?s)\b\.))$|(?:Dr\b\.$)/x },
        young_male: {gender: "m", age: rand(17), in: ["Mr."]}, #rgx: /^\bMr\b\.$/},
        older_male:  {gender: "m", in: ["Mr.", "Dr."]}, 
      } #rgx: /^\b[MD]r\b\.$/}, }
      fix_fixtures["AmericanSuffix"] = {
        young_female: {},
        older_female: {},
        young_male: {},
        older_male:  {} }
      fix_fixtures["BritishPrefix"] = {
        young_female: {gender: "f", age: rand(17), rgx: /^\bMiss\b$/},
        older_female: {gender: "f", rgx: /^\b(?:M(?:is|r)?s)|(?:Dr)\b$/},
        young_male: {gender: "m", age: rand(17), rgx: /^\bMr\b$/},
        older_male:  {gender: "m", rgx: /^\b[MD]r\b$/}, }
      fix_fixtures["EnglishPrefix"] = fix_fixtures["ScottishPrefix"] = fix_fixtures["WelshPrefix"] = fix_fixtures["BritishPrefix"]

#SUFFIXES
      fix_fixtures["BritishSuffix"] = {
        young_female: {age: rand(17), gender: "f", in: [""] },
        older_female: { gender: "f", in: %w( OBE MBE GBE KBE DBE CBE JP GM PhD BSc BA )}, 
        young_male: {age: rand(17), gender: "m", in: [""] },
        older_male: {gender: "m", in: %w( OBE MBE GBE KBE DBE CBE JP GM PhD BSc BA ) }, 
      }
      fix_fixtures["AmericanSuffix"] = { # strictly speaking, gender doesn't matter here, but I'll leave the test in.
        young_female: {age: rand(17), gender: "f", in: [ 'Jr.', ''] + %w( I II III IV V) },
        young_male: { age: rand(17), gender: "m", in: [ 'Jr.', ''] + %w( I II III IV V ) },
        older_male: { gender: "m", in: [ ''] + %w( I II III IV V Sr. ) },
        older_female: { gender: "f", in: [ ''] + %w( I II III IV V Sr. ) }, 
      }


      puts "Describe #{klass}" #because rspec doesn't output this before it blow up! Sheesh!!
      describe klass do
        let(:instance) { k.new }
        subject{ instance }
        it_should_behave_like "a Name class"
        if ["Prefix", "Suffix"].any?{|x| klass.include? x }
          
          it_should_behave_like "it cares about gender and/or age", fix_fixtures[klass] 
        else
          it_should_behave_like "a name generator", fixtures[klass]
        end
      end # describe
    end # loop

  end # Names
end # RandomPerson

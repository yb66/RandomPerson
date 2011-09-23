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
      next unless ["Welsh","German", "English", "Scottish", "Swedish", "Thai","Spanish","French", "Finnish","Basque", "American", "AncientGreek", "Any"].any?{|x| klass.include? x }
      next if ["Prefix", "Suffix"].any?{|x| klass.include? x }
      k = eval "RandomPerson::Names::#{klass}"
      
      
      french_rgx = /^(?:(?:d(?:e|u)\s) | (?:\b\p{Upper}\p{Alpha}+?\b-))? \b\p{Upper}\p{Alpha}+?\b$/x
      hypenated_rgx = /^\b\p{Upper}\p{Alpha}+?\b (?:(?:\s|-)\b\p{Upper}\p{Alpha}+?\b)?$/x 
      unhypenated_rgx = /^\b\p{Upper}\p{Alpha}+?\b\s\b\p{Upper}\p{Alpha}+?\b?$/x 
      thai_style = /^\b\p{Graph}+?\b$/x
      default_fix = {times: 5 } 
      fixtures = {}
      fixtures.default = default_fix
      fixtures["SpanishLast"] = default_fix.merge({ rgx: /^ \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?: (?:\bde\b\s) | (?: \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?:\by\b\s)? ) )? \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b$/x })
      fixtures["AmericanLast"] = default_fix.merge({ rgx: hypenated_rgx } )
      fixtures["AnyLast"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["FrenchLast"] = default_fix.merge({ rgx: french_rgx} )
      fixtures["FrenchFemaleFirst"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["FrenchMaleFirst"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["BasqueLast"] = default_fix.merge({ rgx: unhypenated_rgx  } )
      fixtures["ThaiRomanisedLast"] = default_fix.merge({ rgx: hypenated_rgx  } )
      fixtures["ThaiFemaleFirst"] = default_fix.merge({ rgx: thai_style } )
      fixtures["ThaiMaleFirst"] = default_fix.merge({ rgx: thai_style} )
      fixtures["ThaiLast"] = default_fix.merge({ rgx: thai_style} )
      fixtures["ThaiFirst"] = default_fix.merge({ rgx: thai_style} )
      fixtures["ThaiRomanisedMaleFirst"] = default_fix.merge({ rgx: hypenated_rgx} )
      fixtures["ThaiRomanisedFemaleFirst"] = default_fix.merge({ rgx: hypenated_rgx} )
      fixtures["AncientGreekLast"] = default_fix.merge(
        { rgx: /^\bof\b\s(?:\b\p{Alpha}+?\b\s){0,2}\b\p{Alpha}+?\b$/x } )
      
      puts "#{klass.to_s}_rgx1: #{fixtures[klass][:rgx].inspect}"
      describe klass do
        let(:instance) { k.new }
        subject{ instance }
        it_should_behave_like "a Name class"
        it_should_behave_like "a name generator", fixtures[klass]
      end # SpanishMaleFirst
    end # loop

  end # Names
end # RandomPerson

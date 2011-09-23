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
      next unless ["Spanish", "Finnish", "American"].any?{|x| klass.include? x }
      next if ["Prefix", "Suffix"].any?{|x| klass.include? x }
      k = eval "RandomPerson::Names::#{klass}"
      
      
      default_fix = {times: k::Names.length}
      fixtures = {}
      fixtures.default = default_fix
      fixtures["SpanishLast"] = default_fix.merge({ rgx: /^ \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?: (?:\bde\b\s) | (?: \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?:\by\b\s)? ) )? \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b$/x })
      fixtures["AmericanLast"] = default_fix.merge({ rgx: /^ \b\p{Upper}\p{Alpha}+?\b (?:(?:\s|-)\b\p{Upper}\p{Alpha}+?\b)?$/x } )
      
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

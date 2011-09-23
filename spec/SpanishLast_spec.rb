# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/SpanishLast.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe SpanishLast do
      let(:instance) { SpanishLast.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      it_should_behave_like "a name generator", gender: "m", times: SpanishLast::Names.length, rgx: /^ \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?: (?:\bde\b\s) | (?: \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?:\by\b\s)? ) )? \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b$/x 
    end # SpanishLast

  end # Names
end # RandomPerson

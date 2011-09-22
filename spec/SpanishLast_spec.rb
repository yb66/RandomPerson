# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/SpanishLast.rb"

module RandomPerson
  module Names

    describe SpanishLast do
      let(:instance) { SpanishLast.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        let(:person){ Struct.new :gender, :age }
        subject { instance.execute person.new( "m", rand(100)) }
        it { should_not be_nil }
        1000.times do |_|
          it { should match /^ \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?: (?:\bde\b\s) | (?: \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b\s (?:\by\b\s)? ) )? \b\p{Upper}(?:\p{Alpha}+-)?\p{Alpha}+?\b$/x } 
        end
      end # execute
    end # SpanishLast

  end # Names
end # RandomPerson

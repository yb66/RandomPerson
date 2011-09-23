# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/AmericanLast.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe AmericanLast do
      let(:instance) { AmericanLast.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        let(:person) { Person.new( gender: "m", age: rand(100)) }
        subject { instance.execute person }
        it { should_not be_nil }
        1000.times do |_|
          it { should match /^ \b\p{Upper}\p{Alpha}+?\b (?:(?:\s|-)\b\p{Upper}\p{Alpha}+?\b)?$/x }
        end
      end # execute
    end # AmericanLast

  end # Names
end # RandomPerson

# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/AmericanFemaleFirst.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe AmericanFemaleFirst do
      let(:instance) { AmericanFemaleFirst.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        subject { instance.execute Person.new( gender: "f", age: rand(100)) }
        it { should_not be_nil }
        1.times do |_|
          it { should match /^\p{Upper}\p{Alpha}+$/ }
        end
      end # execute
    end # AmericanFemaleFirst

  end # Names
end # RandomPerson

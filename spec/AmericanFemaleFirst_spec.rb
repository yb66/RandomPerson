# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/AmericanFemaleFirst.rb"

module RandomPerson
  module Names

    describe AmericanFemaleFirst do
      let(:instance) { AmericanFemaleFirst.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        let(:person){ Struct.new :gender, :age }
        subject { instance.execute person.new( "f", rand(100)) }
        it { should_not be_nil }
        1000.times do |_|
          it { should match /^\p{Upper}\p{Alpha}+$/ }
        end
      end # execute
    end # AmericanFemaleFirst

  end # Names
end # RandomPerson

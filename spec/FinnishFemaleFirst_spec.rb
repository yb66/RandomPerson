# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/FinnishFemaleFirst.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe FinnishFemaleFirst do
      let(:instance) { FinnishFemaleFirst.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        subject { instance.execute Person.new( gender: "f", age: rand(100)) }
        it { should_not be_nil }
        20.times do |_|
          it { should match /^\p{Upper}\p{Alpha}+$/ }
        end
      end # execute
    end # FinnishFemaleFirst

  end # Names
end # RandomPerson

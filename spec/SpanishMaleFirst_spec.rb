# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/SpanishMaleFirst.rb"

module RandomPerson
  module Names

    describe SpanishMaleFirst do
      let(:instance) { SpanishMaleFirst.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        let(:person){ Struct.new :gender, :age }
        subject { instance.execute person.new( "m", rand(100)) }
        it { should_not be_nil }
        100.times do |_|
          it { should match /\p{Upper}\p{Alpha}+/ }
        end
      end # execute
    end # SpanishMaleFirst

  end # Names
end # RandomPerson

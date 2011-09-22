# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/FinnishLast.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe FinnishLast do
      let(:instance) { FinnishLast.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        subject { instance.execute Person.new( gender: "m", age: rand(100)) }
        it { should_not be_nil }
        10.times do |_|
          it { should match /^ \b\p{Upper}\p{Alpha}+?\b $/x }
        end
      end # execute
    end # FinnishLast

  end # Names
end # RandomPerson

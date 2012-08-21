# encoding: UTF-8

require "spec_helper"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/AnyLast.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe AnyLast do
      let(:instance) { AnyLast.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        subject { instance.execute Person.new( gender: "m", age: rand(100)) }
        it { should_not be_nil }
        1000.times do |_|
          it { should match /^ \b\p{Upper}\p{Alpha}+?\b (?:(?:\s|-)\b\p{Upper}\p{Alpha}+?\b)?$/x }
        end
      end # execute
    end # AnyLast

  end # Names
end # RandomPerson

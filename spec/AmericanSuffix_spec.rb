# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/AmericanSuffix.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe AmericanSuffix do
      let(:instance) { AmericanSuffix.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        context "Who is young" do
          let(:p) { instance.execute Person.new( age: 16) }
          subject { p } 
          it { should_not be_nil }
          1000.times do |_|
            it { should be_in instance.names[0..-2] }
          end
        end
        context "Who is older" do
          let(:p) { instance.execute Person.new( age: 18) }
          subject { p } 
          it { should_not be_nil }
          1000.times do |_|
            it { should be_in instance.names[1..-1] }
          end
        end
      end # execute

    end # AmericanSuffix

  end # Names
end # RandomPerson

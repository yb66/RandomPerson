# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/FinnishPrefix.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe FinnishPrefix do
      let(:instance) { FinnishPrefix.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        context "Given a male" do
          context "Who is young" do
            let(:p) { instance.execute Person.new( gender: "m", age: rand(17)) }
            subject { p } 
            it { should_not be_nil }
            it { should eql "herra" }
          end
          context "Who is older" do
            let(:p) { instance.execute Person.new( gender: "m", age: rand(83) + 17 ) }
            subject { p } 
            it { should_not be_nil }
            it { should be_in instance.names[0..1] } 
          end
        end # male
        context "Given a female" do
          context "Who is young" do
            let(:p) { instance.execute Person.new( gender: "f", age: rand( 17 ) ) }
            subject { p } 
            it { should_not be_nil }
            it { should eql "neiti" }
          end
          context "Who is older" do
            let(:p) { instance.execute Person.new( gender: "f", age: rand(83) + 17) }
            subject { p }
            it { should_not be_nil }
            it { should be_in instance.names[1..-1] }
          end 
        end # female

      end
    end # FinnishPrefix
  end # Names
end # RandomPerson

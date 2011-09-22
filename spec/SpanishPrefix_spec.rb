# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/SpanishPrefix.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe SpanishPrefix do
      let(:instance) { SpanishPrefix.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        context "Given a male" do
          context "Who is young" do
            let(:p) { instance.execute Person.new( gender: "m", age: 9) }
            subject { p } 
            it { should_not be_nil }
            it { should eql "Sr." }
          end
          context "Who is older" do
            let(:p) { instance.execute Person.new( gender: "m", age: 45) }
            subject { p } 
            it { should_not be_nil }
            it { 
              should be_in ["Sr.", "Dr."] }
          end
        end # male
        context "Given a female" do
          context "Who is young" do
            let(:p) { instance.execute Person.new( gender: "f", age: 9 ) }
            subject { p } 
            it { should_not be_nil }
            it { should eql "Srta." }
          end
          context "Who is older" do
            let(:p) { instance.execute Person.new( gender: "f", age: 45) }
            subject { p }
            it { should_not be_nil }
            it { should be_in ["Srta.", "Dra.", "Sra."] }
          end 
        end # female

      end
    end # SpanishPrefix
  end # Names
end # RandomPerson

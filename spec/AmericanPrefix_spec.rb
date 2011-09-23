# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/AmericanPrefix.rb"
require_relative "../lib/randomperson/person.rb"

module RandomPerson
  module Names

    describe AmericanPrefix do
      let(:instance) { AmericanPrefix.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        context "Given a male" do
          context "Who is young" do
            let(:person) { Person.new( gender: "m", age: rand(17)) }
            subject { instance.execute person } 
            it { should_not be_nil }
            it { should eql "Mr." }
          end
          context "Who is older" do
            let(:person) { Person.new( gender: "m", age: rand(83) + 17) }
            subject { instance.execute person } 
            it { should_not be_nil }
            it { should be_in ["Mr.", "Dr."] }
          end
        end # male
        context "Given a female" do
          context "Who is young" do
            let(:person) { Person.new( gender: "f", age: rand(17) ) }
            subject { instance.execute person } 
            it { should_not be_nil }
            it { should eql "Miss" }
          end
          context "Who is older" do
            let(:person) {  Person.new( gender: "f", age: rand(83) + 17) }
            subject { instance.execute person }
            it { should_not be_nil }
            it { should be_in ["Miss", "Dr.", "Mrs.", "Ms."] }
          end 
        end # female
      
      end
    
    end # AmericanPrefix
  end # Names
end # RandomPerson

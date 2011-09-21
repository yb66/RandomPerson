# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/Names/SpanishPrefix.rb"

module RandomPerson
  module Names

    describe SpanishPrefix do
      let(:instance) { SpanishPrefix.new }
      subject{ instance }
      it_should_behave_like "a Name class"
      describe :execute do
        let(:person){ Struct.new :gender, :age }
        context "Given a male" do
          context "Who is young" do
            subject { instance.execute person.new( "m", 9) }
            it { should_not be_nil }
            it { should eql "Sr." }
          end
          context "Who is older" do
            subject { instance.execute person.new( "m", 45) }
            it { should_not be_nil }
            it { should be_in ["Sr.", "Dr."] }
          end
        end # male
        context "Given a female" do
          context "Who is young" do
            subject { instance.execute person.new( "f", 9 ) }
            it { should_not be_nil }
            it { should eql "Srta." }
          end
          context "Who is older" do
            subject { instance.execute person.new( "f", 45) }
            it { should_not be_nil }
            it { should be_in ["Srta.", "Dra.", "Sra."] }
          end 
        end # female

      end
    end # SpanishPrefix
  end # Names
end # RandomPerson

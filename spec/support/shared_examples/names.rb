# encoding: UTF-8


shared_examples "a Name class", :parent => "Name" do

  describe :execute do
    let(:person){ Struct.new :gender, :age }
    context "Given a male" do
      context "Who is young" do
        subject { instance.execute person.new( "m", 9) }
        it { should_not be_nil }
      end
    end
  end

  describe :formats do
    subject { instance.formats }
    it { should be_a_kind_of Hash }
    it { should have_at_least(1).items }
  end

  describe :formats_ratiod do
    subject { instance.formats_ratiod }
    it { should be_a_kind_of Array }
    it { should all_be_a_kind_of Range }
  end

  describe :names do
    subject { instance.names }
    it { should be_a_kind_of Array }
    it { should all_be_a_kind_of String }
  end
end

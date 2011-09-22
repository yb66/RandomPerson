# encoding: UTF-8



shared_examples "a Name class", :parent => "Name" do

  describe "Generally" do
    subject { instance }
    it { should_not be_nil }
    it { should respond_to( :execute ) }
    it {  should respond_to(:formats ) }
    it { should respond_to( :formats_ratiod ) }
    it { should respond_to(:names)} 
    it { should respond_to(:possibles)}
  end

  describe :formats do
    subject { instance.formats }
    it { should be_a_kind_of Array}
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

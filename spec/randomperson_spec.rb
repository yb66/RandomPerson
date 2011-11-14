# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "../lib/randomperson.rb"

shared_examples "a Person" do
  it { subject.first.should_not be_nil }
  it { subject.first.should be_a_kind_of String }
  it { subject.last.should_not be_nil }
  it { subject.last.should be_a_kind_of String }
  it { subject.prefix.should_not be_nil }
  it { subject.prefix.should be_a_kind_of String }
end

shared_examples "there is more than one demographic" do
  context "Given a new demographic" do
    before(:all) { r.demographic("America").add_American }
    context "but not changing to it" do
      let(:last_run) { r.person }
      subject { last_run } 
      it { should equal first_run }
      context "changing to the new demographic" do
        let(:new_demo_person) { r.person "America" }
        subject { new_demo_person } 
        it { should_not equal last_run }
      end
    end
  end
end

shared_examples "getting the last person" do
  context "on first run" do
    subject{ first_run }
    it_behaves_like "a Person"
    context "on next run" do
      context "Given no demographic" do
        subject { r.person }
        it { should equal first_run }
      end
      context "Given the same demographic" do
        subject{ r.person "Spain" }
        it { should equal first_run }
        it_behaves_like "there is more than one demographic"
      end
    end
  end
end

shared_examples "clear or reset" do
  let(:r) { RandomPerson() }
  before(:all) {
    r.demographic("Spain").add_Spanish
    r.demographic("Finland").add_Finnish
    r.generate "Spain"
    r.generate
    r.generate "Finland"
    r.generate
    r.generate "Spain"
    r.clear
  }
  subject { r }
  it { should_not be_nil }
  it { should be_a_kind_of RandomPerson::Facade }
  specify { subject.generators.should be_empty }
  specify { subject.demographics.should be_empty }
  specify { expect { subject.person }.to raise_error }
  specify { expect { subject.generate }.to raise_error }
  specify { expect { subject.gen_new }.to raise_error }
end


describe RandomPerson do
  
  describe :person do
    let(:r) { RandomPerson() }
    context "Given a demographic" do
      context "With a name" do
        context "and a demographic specified" do
          before(:all) {
            r.demographic("Spain").add_Spanish
          }
          let(:first_run) { r.person "Spain" }
          it_behaves_like "getting the last person"
        end

        context "and no demographic specified" do
          before(:all) {
            r.demographic("Spain").add_Spanish
          }
          let(:first_run) { r.person }
          it_behaves_like "getting the last person"
        end
          
      end
      
      context "Without a name" do
        context "and a demographic specified" do
          before(:all) {
            r.demographic.add_Spanish
          }
          let(:first_run) { r.person "Spain" }
          subject { r.person }
          it { should equal first_run }
        end

        context "and no demographic specified" do
          before(:all) {
            r.demographic.add_Spanish
          }
          let(:first_run) { r.person }
          subject { r.person }
          it { should equal first_run }
        end
      end
    end
  end # :person
  
  describe :generators do
    let(:r) { RandomPerson() }
    before(:all) {
      r.demographic("Spain").add_Spanish
      r.demographic("Finland").add_Finnish
    }
    context "Before first run" do
      subject { r.generators }
      it { should be_empty }
    end
    context "First run" do
      before { 
        r.generate "Spain"
        r.generate
        r.generate "Finland"
        r.generate
        r.generate "Spain"
      }
      subject { r.generators }
      it { should_not be_empty }
      specify { subject.keys.should include("Spain", "Finland") } 
    end
  end # generators
  
  describe :clear do
    it_behaves_like "clear or reset"
  end
  
  describe :reset do
    it_behaves_like "clear or reset"
  end
  
  describe :generate do
    let(:r) { RandomPerson() }
    before(:all) {
      r.demographic("Spain").add_Spanish
    }
    let(:people) { 
      people = []
      1000.times{ people << r.generate }
      people
    }
    subject { r.generate }
    it { should_not be_nil }
    it { should be_a_kind_of RandomPerson::Person }
    it_behaves_like "a Person"
    it { should_not satisfy {|person| people.include? person } }
  end
end

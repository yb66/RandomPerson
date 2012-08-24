# encoding: UTF-8

require "spec_helper"
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
  }
  subject { r.clear }
  it { should be_nil }
  specify { r.should_not be_nil }
  specify { r.should be_a_kind_of RandomPerson::Facade }
  specify { r.generators.should be_empty }
  specify { r.demographics.should be_empty }
end


describe RandomPerson do
  
  describe :person do
    let(:r) { RandomPerson() }
    context "Given a demographic" do
      context "With a name" do
        context "and one demographic specified" do
          before(:all) {
            r.demographic("Spain").add_Spanish
          }
          let(:first_run) { r.person "Spain" }
          subject{ first_run }
          it_behaves_like "a Person"
          context "on next run" do
            context "Given no demographic" do
              subject { r.person }
              it { should equal first_run }
              context "and then given the same demographic explicitly" do
                subject{ r.person "Spain" }
                it { should equal first_run }
                context "and then given a demo name that doesn't exist" do
                  subject{ r.person "Spurious" }
                  it { should be_nil }
                  context "and then given no demo name" do
                    subject{ r.person }
                    it { should equal first_run }
                  end
                  context "and then given the last good demographic explicitly" do
                    subject{ r.person "Spain" }
                    it { should equal first_run }
                  end
                end
              end
            end
          end
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
        context "and with a demographic specified" do
          before(:all) {
            r.clear
            r.demographic.add_Spanish
          }
          subject { r.person "Spain" }
          it { should be_nil }
        end

        context "and no demographic specified" do
          before(:all) {
            r.demographic.add_Spanish
          }
          let(:first_run) { r.person }
          subject { r.person }
          it { should equal first_run }
          context "on repeated runs" do
            before(:all) {
              r.clear
              r.demographic.add_Spanish
              r.generate
              r.generate
            }
            let(:last) { r.person }
            subject { r.person }
            it { should equal last }
          end
            
        end
      end
    end

    context "With no demographic" do
      context "Already loaded" do
        before { r.demographics.clear }
        subject { r.person }
        it { should be_a_kind_of RandomPerson::Person }
        context "and given a demo name (that does not exist)" do
          subject { r.person "Not loaded" }
          it { should be_nil }
        end
      end
      context "Because they've been cleared" do
        before { r.demographics.clear }
        subject { r.person }
        it { should be_a_kind_of RandomPerson::Person }
        context "and given a demo name (that does not exist)" do
          subject { r.person "Been cleared" }
          it { should be_nil }
          context "and given a block with a raise" do
            subject { 
              r.person "Does not exist" do
                fail "This demo name does not exist!"
              end
            }
            specify { expect { subject }.to raise_error }
          end
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
    context "Before a demographic has been loaded" do
      subject { r.generate }
      it { should_not be_nil }
      it { should be_a_kind_of RandomPerson::Person }
    end
    context "When there is a demographic loaded" do
      before(:all) {
        r.demographic("Spain").add_Spanish
      }
      let(:people) { 
        people = []
        1000.times{ people << r.generate }
        people
      }
      context "Given a demographic name" do
        context "That has been added to demographics" do
          subject { r.generate "Spain" }
          it { should_not be_nil }
          it { should be_a_kind_of RandomPerson::Person }
          it_behaves_like "a Person"
          it { should_not satisfy {|person| people.include? person } }
        end
        context "That has not been added to demographics" do
          subject { r.generate "Spurious" }
          it { should be_nil }
        end
      end
      context "Given a no demographic name" do
        subject { r.generate }
        it { should_not be_nil }
        it { should be_a_kind_of RandomPerson::Person }
        it_behaves_like "a Person"
        it { should_not satisfy {|person| people.include? person } }
      end
    end
    context "When there is no demographic loaded" do
      context "Given a demographic name" do
        subject { r.generate "Spain" }
      end
    end
  end
    
  
  describe :demographics do
    let(:r) { RandomPerson() }
    context "With no demographics loaded" do
      subject { r.demographics }
      it { should be_empty }
      it { should be_a_kind_of Hash }
    end
    context "Given a demographic" do
      context "With a name" do
        before(:all) {
          r.demographic("Spain").add_Spanish
        }
        subject { r.demographics }
        it { should_not be_empty }
        it { should be_a_kind_of Hash }
        specify { subject.first.should be_a_kind_of Array }
        specify { subject.first.first.should be_a_kind_of String }
        specify { subject.first.last.should be_a_kind_of RandomPerson::Demographic }
      end
      context "Without a name" do
        before(:all) {
          r.demographic.add_Spanish
        }
        subject { r.demographics }
        it { should_not be_empty }
        it { should be_a_kind_of Hash }
        specify { subject.first.should be_a_kind_of Array }
        specify { subject.first.first.should be_a_kind_of String }
        specify { subject.first.last.should be_a_kind_of RandomPerson::Demographic }
      end
      
      context "With options" do
        context "With a named demographic" do
          let(:lower){ rand(99) }
          let(:upper){ rand(100 - lower) + lower }
          let(:females) { rand(10) } 
          let(:males) { rand(10) }
          before(:all) {
            r.demographic("Random!", gender_ratio: [females,males] , age_lower: lower, age_upper: upper ).add_Spanish
          }
          subject { r.demographics }
          it { should_not be_empty }
          it { should be_a_kind_of Hash }
          specify { subject.first.should be_a_kind_of Array }
          specify { subject.first.first.should be_a_kind_of String }
          specify { subject.first.last.should be_a_kind_of RandomPerson::Demographic }
          specify { subject.first.last.age_lower.should == lower }
          specify { subject.first.last.age_upper.should == upper }
          specify { subject.first.last.gender_ratio.should == [females,males] }
        end
        context "Without a named demographic" do
          let(:lower){ rand(99) }
          let(:upper){ rand(100 - lower) + lower }
          let(:females) { rand(10) } 
          let(:males) { rand(10) }
          before(:all) {
            r.demographic(gender_ratio: [females,males] , age_lower: lower, age_upper: upper ).add_Spanish
          }
          subject { r.demographics }
          it { should_not be_empty }
          it { should be_a_kind_of Hash }
          specify { subject.first.should be_a_kind_of Array }
          specify { subject.first.first.should be_a_kind_of String }
          specify { subject.first.last.should be_a_kind_of RandomPerson::Demographic }
          specify { subject.first.last.age_lower.should == lower }
          specify { subject.first.last.age_upper.should == upper }
          specify { subject.first.last.gender_ratio.should == [females,males] }
        end
      end
    end
  end
    
    
end

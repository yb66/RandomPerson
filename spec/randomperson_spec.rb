# encoding: UTF-8

require "spec_helper"
require_relative "../lib/randomperson.rb"

shared_examples "clear or reset" do
  Given!(:before) {
    r.demographic("Spain").add_Spanish
    r.demographic("Finland").add_Finnish
    r.generate "Spain"
    r.generate
    r.generate "Finland"
    r.generate
    r.generate "Spain"
  }
  Then { r.clear.nil? }
  And { r.should_not be_nil }
  And { r.should be_a_kind_of RandomPerson::Facade }
  And { r.generators.should be_empty }
  And { r.demographics.should be_empty }
end


describe RandomPerson do
  Given(:r) { RandomPerson() }

  describe :person do
    context "Given a demographic" do
      context "With a name" do
        demo_name = "Spain"
        context "and one demographic specified, that of #{demo_name}," do
          Given!(:spanish_was_added) {
            r.demographic("Spain").add_Spanish
          }
          Given(:first_run) { r.person "Spain" }
          Then { first_run.first.should_not be_nil }
          And { first_run.first.should be_a_kind_of String }
          And { first_run.last.should_not be_nil }
          And { first_run.last.should be_a_kind_of String }
          And { first_run.prefix.should_not be_nil }
          And { first_run.prefix.should be_a_kind_of String }
          context "on next run" do
            context "Given no demographic" do
              Then { r.person == first_run }
              context "and then given the same demographic explicitly" do
                Then { r.person("Spain") == first_run }
                context "and then given a demo name that doesn't exist" do
                  Then { r.person("Spurious").nil? }
                  context "and then given no demo name" do
                    Then { r.person == first_run }
                  end
                  context "and then given the last good demographic explicitly" do
                    Then { r.person("Spain") == first_run }
                  end
                end
              end
            end
          end
        end

        context "and no demographic specified" do
          Given!(:spanish_was_added) {
            r.demographic("Spain").add_Spanish
          }
          context "on first run" do
            Given!(:first_run) { r.person }
            Then { first_run.first.should_not be_nil }
            And { first_run.first.should be_a_kind_of String }
            And { first_run.last.should_not be_nil }
            And { first_run.last.should be_a_kind_of String }
            And { first_run.prefix.should_not be_nil }
            And { first_run.prefix.should be_a_kind_of String }
            context "on next run" do
              context "Given no demographic" do
                When(:person) { r.person }
                Then { person == first_run }
              end
              context "Given the same demographic" do
                When(:spanish){ r.person "Spain" }
                Then { spanish == first_run }
                context "there is more than one demographic" do
                  context "Given a new demographic" do
                    Given(:american_added) { r.demographic("America").add_American }
                    context "but not changing to it" do
                      When(:r_person) { r.person }
                      Then { r_person == first_run }
                      context "changing to the new demographic" do
                        Given(:new_demo_person) { r.person "America" }
                        When(:new_person) { new_demo_person }
                      end
                    end
                  end
                end
              end
            end
          end
        end
          
      end
      
      context "Without a name" do
        context "and with a demographic specified" do
          Given(:spanish_without_a_name) {
            r.clear
            r.demographic.add_Spanish
          }
          When(:person_is_spanish) { r.person "Spain" }
          Then { person_is_spanish.nil? }
        end

        context "and no demographic specified" do
          Given!(:spanish_added) { r.demographic.add_Spanish }
          When(:first_run) { r.person }
          Then { r.person == first_run }
          context "on repeated runs" do
            Given!(:clearing) {
              r.clear
              r.demographic.add_Spanish
              r.generate
              r.generate
            }
            Given(:last_generated) { r.person }
            When(:person_generated) { r.person }
            Then { person_generated == last_generated }
          end
            
        end
      end
    end

    context "With no demographic" do
      Given!(:cleared) { r.demographics.clear }
      Then { r.person.kind_of? RandomPerson::Person }
      Then { r.person("Not loaded").nil? }
      context "Because they've been cleared" do
        Then { r.person.kind_of? RandomPerson::Person }
        context "and given a demo name (that does not exist)" do
          Then { r.person("Been cleared").nil? }
          context "and given a block with a raise" do
            Then {
              expect {
                r.person "Does not exist" do
                  fail "This demo name does not exist!"
                end
              }
            }
          end
        end
      end
    end
  end # :person
  
  
  describe :generators do
    Given(:spanish_and_finish_added) {
      r.demographic("Spain").add_Spanish
      r.demographic("Finland").add_Finnish
    }
    context "Before first run" do
      Then { r.generators.empty? }
    end
    context "First run" do
      Given(:some_people_are_generated) {
        r.generate "Spain"
        r.generate
        r.generate "Finland"
        r.generate
        r.generate "Spain"
      }
      Then { r.generators.empty? }
      And { r.generators.keys.all?{|x| (x == "Spain") || (x == "Finland")}} 
    end
  end # generators
  
  describe :clear do
    it_behaves_like "clear or reset"
  end
  
  describe :reset do
    it_behaves_like "clear or reset"
  end
  
  describe :generate do
    context "Before a demographic has been loaded" do
      Then { !r.generate.nil? }
      And { r.generate.kind_of? RandomPerson::Person }
    end
    context "When there is a demographic loaded" do
      Given!(:demographic) {
        r.demographic("Spain").add_Spanish
      }
      Given(:people) {
        people = []
        1000.times{ people << r.generate }
        people
      }
      context "Given a demographic name" do
        context "That has been added to demographics" do
          When(:spanish) { r.generate "Spain" }
          Then { !spanish.nil? }
          And { spanish.kind_of? RandomPerson::Person }
          And { spanish.first.should_not be_nil }
          And { spanish.first.should be_a_kind_of String }
          And { spanish.last.should_not be_nil }
          And { spanish.last.should be_a_kind_of String }
          And { spanish.prefix.should_not be_nil }
          And { spanish.prefix.should be_a_kind_of String }
          Then { !people.include?(spanish) }
        end
        context "That has not been added to demographics" do
          When(:spurious) { r.generate "Spurious" }
          Then { spurious.nil? }
        end
      end
      context "Given a no demographic name" do
        Then { !r.generate.nil? }
        And { r.generate.kind_of? RandomPerson::Person }
        And { r.generate.first.should_not be_nil }
        And { r.generate.first.should be_a_kind_of String }
        And { r.generate.last.should_not be_nil }
        And { r.generate.last.should be_a_kind_of String }
        And { r.generate.prefix.should_not be_nil }
        And { r.generate.prefix.should be_a_kind_of String }
        And { !people.include? r.generate }
      end
    end
    context "When there is no demographic loaded" do
      When(:spain) { r.generate "Spain" }
      Then { spain.nil? }
      When(:no_name) { r.generate }
      Then { !no_name.nil? }
    end
  end
    
  
  describe :demographics do
    context "With no demographics loaded" do
      Then { r.demographics.empty? }
      And { r.demographics.kind_of? Hash }
    end
    context "Given a demographic" do
      context "With a name" do
        Given!(:spanish_added) {
          r.demographic("Spain").add_Spanish
        }
        Then { !r.demographics.empty? }
        And { r.demographics.kind_of? Hash }
        And { r.demographics.first.kind_of? Array }
        And { r.demographics.first.first.kind_of? String }
        And { r.demographics.first.last.kind_of? RandomPerson::Demographic }
      end
      context "Without a name" do
        Given!(:demo_spanish) {
          r.demographic.add_Spanish
        }
        Then { !r.demographics.empty? }
        And { r.demographics.kind_of? Hash }
        And { r.demographics.first.kind_of? Array }
        And { r.demographics.first.first.kind_of? String }
        And { r.demographics.first.last.kind_of? RandomPerson::Demographic }
      end
      
      context "With options" do
        context "With a named demographic" do
          Given(:lower){ rand(99) }
          Given(:upper){ rand(100 - lower) + lower }
          Given(:females) { rand(10) }
          Given(:males) { rand(10) }
          Given!(:demo) {
            r.demographic("Random!", gender_ratio: [females,males] , age_lower: lower, age_upper: upper ).add_Spanish
          }
          Then { !r.demographics.empty? }
          And { r.demographics.kind_of? Hash }
          And { r.demographics.first.should be_a_kind_of Array }
          And { r.demographics.first.first.should be_a_kind_of String }
          And { r.demographics.first.last.should be_a_kind_of RandomPerson::Demographic }
          And { r.demographics.first.last.age_lower.should == lower }
          And { r.demographics.first.last.age_upper.should == upper }
          And { r.demographics.first.last.gender_ratio.should == [females,males] }
        end
        context "Without a named demographic" do
          Given(:lower){ rand(99) }
          Given(:upper){ rand(100 - lower) + lower }
          Given(:females) { rand(10) }
          Given(:males) { rand(10) }
          Given!(:spanish_was_added) {
            r.demographic(gender_ratio: [females,males] , age_lower: lower, age_upper: upper ).add_Spanish
          }
          Then { r.demographics.kind_of? Hash }
          And { !r.demographics.empty? }
          And { r.demographics.first.should be_a_kind_of Array }
          And { r.demographics.first.first.should be_a_kind_of String }
          And { r.demographics.first.last.should be_a_kind_of RandomPerson::Demographic }
          And { r.demographics.first.last.age_lower.should == lower }
          And { r.demographics.first.last.age_upper.should == upper }
          And { r.demographics.first.last.gender_ratio.should == [females,males] }
        end
      end
    end
  end
    
    
end

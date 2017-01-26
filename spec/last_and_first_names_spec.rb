# encoding: UTF-8

require "spec_helper"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/person.rb"
require_relative "../lib/randomperson/demographic.rb"
require_relative "../lib/randomperson.rb"
require_relative "./support/helpers.rb"

module RandomPerson
  module Names

  describe "RandomPerson::Names" do

    before :all do
      Demographic.new.require_and_add(Demographic.load_names)
    end


    RandomPerson().loaded_classes.each do |klass|
      klass_basename = klass.name.split("::").last

      puts "Describe #{klass.name}" #because rspec doesn't output this before it blow up! Sheesh!!
      describe klass_basename do
        let(:instance) { 
          klass.new
        }
        subject{ instance }
        it_should_behave_like "a Name class"
        if ["Prefix", "Suffix"].any?{|x| klass_basename.include? x }
          it_should_behave_like "it cares about gender and/or age", RandomPerson::Spec::Helpers.fix_fixtures[klass_basename] 
        else
          it_should_behave_like "a name generator", RandomPerson::Spec::Helpers.fixtures[klass_basename]
        end
      end # describe
    end # loop
  end

  end # Names
end # RandomPerson

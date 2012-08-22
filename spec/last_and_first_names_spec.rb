# encoding: UTF-8

require "spec_helper"
require_relative "./support/shared_examples/names.rb"
require_relative "../lib/randomperson/person.rb"
require_relative "../lib/randomperson/demographic.rb"
require_relative "./support/helpers.rb"

module RandomPerson
  module Names

    Demographic.new.require_and_add(Demographic.load_names).each do |klass|
      klass = klass.split("::").last

      puts "Describe #{klass}" #because rspec doesn't output this before it blow up! Sheesh!!
      describe klass do
        let(:instance) { RandomPerson::Constant.new("RandomPerson::Names::#{klass}").to_constant.new }
        subject{ instance }
        it_should_behave_like "a Name class"
        if ["Prefix", "Suffix"].any?{|x| klass.include? x }
          it_should_behave_like "it cares about gender and/or age", RandomPerson::Spec::Helpers.fix_fixtures[klass] 
        else
          it_should_behave_like "a name generator", RandomPerson::Spec::Helpers.fixtures[klass]
        end
      end # describe
    end # loop

  end # Names
end # RandomPerson

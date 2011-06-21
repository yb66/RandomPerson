require 'rspec'
require_relative "../lib/randomperson/choice.rb"


module RandomPerson
  
  describe Choice do
    
    it "should not blow up on instatiation" do
      Choice.new.should_not == nil
    end
  end # Choice
end # RandomPerson
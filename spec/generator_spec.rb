require 'rspec'
require_relative "../lib/randomperson/generator.rb"


module RandomPerson
  
  describe Generator do
    
    it "should not blow up on instatiation" do
      Generator.new.should_not == nil
    end
  end # Generator
end # RandomPerson
require 'rspec'
require_relative "../lib/randomperson/name.rb"


module RandomPerson
  
  describe Name do
    
    it "should not blow up on instatiation" do
      Name.new.should_not == nil
    end
  end # Name
end # RandomPerson
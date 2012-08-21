# encoding: UTF-8

require "spec_helper"
require_relative "../lib/randomperson/demographic.rb"


module RandomPerson
  
  describe Demographic do
    
    it "should not blow up on instatiation" do
      Demographic.new.should_not == nil
    end
  end # Demographic
end # RandomPerson

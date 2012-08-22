# encoding: UTF-8

require "spec_helper"
require_relative "../lib/randomperson/demographic.rb"


module RandomPerson
  
  describe Demographic do

    
    describe "available_classes" do
      before(:all) { Demographic.available_name_files.clear }
      subject { Demographic.available_name_files }
      it { should_not be_nil }
      it { should be_a_kind_of Set }
      it { should be_empty }
    end
    
    describe "Loading" do
      subject { Demographic.load_names }
      it { should_not be_nil }
      it { should be_a_kind_of Array }
      it { should_not be_empty }
      specify { subject.map{|f| File.basename(f, ".rb")}.should include "welsh-prefix" }
    end
    
    describe "Translating" do
      %w{ancient-greek-female-first german-female-first spanish-male-first welsh-prefix}.each do |name|
        file_name = File.expand_path( File.join( File.dirname(__FILE__),"../lib/randomperson/names", "#{name}.rb") )
        expected = "RandomPerson::Names::#{name.split("-").map(&:capitalize).join}"
        it "should require and return the class name" do
          Demographic.translate( file_name ).should == expected
        end
      end
    end

    describe "require_and_add" do
      subject { 
        Demographic.new.require_and_add(Demographic.load_names)
      }
      it { should_not be_nil }
      it { should be_a_kind_of Array }
      it { should_not be_empty }
    end
    
    describe "Instatiation" do
      subject { Demographic.new }
      it { should_not == nil }
    end
  end # Demographic
end # RandomPerson

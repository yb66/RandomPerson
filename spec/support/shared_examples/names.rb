# encoding: UTF-8

dir = File.dirname(__FILE__)
spec_dir = File.expand_path( File.join dir, "../../" )

require_relative File.expand_path( File.join spec_dir, "../lib/randomperson/person.rb" )

shared_examples "it cares about gender and/or age" do |opts={}|
  opts.each{|k,v| opts[k] = { gender: "m", times: 5, age: rand(83)+17,  }.merge( v ) }

  context "Given a male" do
    context "Who is young" do
      it_should_behave_like "a name generator" , opts[:young_male]
    end
    context "Who is older" do
      it_should_behave_like "a name generator" , opts[:older_male]
    end
  end
  context "Given a female" do
    context "Who is young" do
      it_should_behave_like "a name generator" , opts[:young_female]
    end
    context "Who is older" do
      it_should_behave_like "a name generator" , opts[:older_female]
    end
  end
end

shared_examples "a name generator" do |opts={}|
  opts = {times: 1000, rgx: /^\p{Upper}\p{Alpha}+$/, gender: "f", age: rand(100),}.merge( opts )
  describe :execute do
    subject { instance.execute RandomPerson::Person.new( gender: opts[:gender], age: opts[:age] ) }
    it { should_not be_nil }

    opts[:times].times do |_|
      opts[:rgx].nil? ? it { should match opts[:rgx]  } : break
      opts[:in].nil? ? it { should be_in opts[:in] } : break
    end
  end # execute
end


shared_examples "a Name class", :parent => "Name" do

  describe "Generally" do
    subject { instance }
    it { should_not be_nil }
    it { should respond_to( :execute ) }
    it {  should respond_to(:formats ) }
    it { should respond_to( :formats_ratiod ) }
    it { should respond_to(:names)} 
    it { should respond_to(:possibles)}
  end


  describe :formats_ratiod do
    subject { instance.formats_ratiod }
    it { should be_a_kind_of Array }
    it { should all_be_a_kind_of Range }
  end

  describe :names do
    subject { instance.names }
    it { should be_a_kind_of Array }
    it { should all_be_a_kind_of String }
  end
end

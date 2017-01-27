# encoding: UTF-8

dir = File.dirname(__FILE__)
spec_dir = File.expand_path( File.join dir, "../../" )

require_relative File.expand_path( File.join spec_dir, "../lib/randomperson/person.rb" )

shared_examples "it cares about gender and/or age" do |opts={}|
  opts.each{|k,v| opts[k] = { gender: "m", times: 5, age: rand(83)+17,  }.merge( v ) }

  opts.each_pair do |k,v|
    context "Given a #{k.to_s.gsub("_", " ")}" do
      it_should_behave_like "a name generator" , opts[k]
    end
  end
end

shared_examples "a name generator" do |opts={}|
  opts = {times: 1000,  gender: "f", age: rand(100),}.merge( opts )
  opts[:rgx] = /^\p{Upper}\p{Alpha}+$/x if opts[:in].nil? && opts[:rgx].nil? 
  describe :execute do
    subject { instance.execute RandomPerson::Person.new( gender: opts[:gender], age: opts[:age] ) }
    it { should_not be_nil }

    opts[:times].times do |_|
      opts[:rgx].nil? ?  nil : it { should match opts[:rgx]  }
      opts[:in].nil? ? nil : it { should be_in opts[:in] }
    end
  end # execute
end


shared_examples "a Name class", :parent => "Name" do

  describe "Generally" do
    subject { instance }
    it { should_not be_nil }
    it { should respond_to( :execute ) }
    it { should respond_to(:formats ) }
    it { should respond_to( :formats_ratiod ) }
    it { should respond_to(:names)} 
    it { should respond_to(:possibles)}
    specify { subject.class.constants.should_not be_empty }
  end


  describe :formats_ratiod do
    subject { instance.formats_ratiod }
    it { should be_a_kind_of Array }
    it { should all_be_a_kind_of Range }
    specify { (0..99).all?{|i| subject.index_in_range( i ).kind_of? Fixnum }.should be true } # this should make sure that format ratios are specified properly
  end

  describe :names do
    subject { instance.names }
    it { should be_a_kind_of Array }
    it { should all_be_a_kind_of String }
  end
end

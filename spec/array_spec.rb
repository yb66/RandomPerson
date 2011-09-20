# encoding: UTF-8

require_relative "./rspec_helper.rb"
require_relative "../lib/randomperson/ext/array.rb"

describe Array do

  describe :rand do
    let(:m1) { 1_000_000 }
    let(:r) { m1 * 10 }
    let(:range) { 
      u = rand(r) + m1
      (u..u+10)
    }
    subject { range.to_a.rand }
    it { range.cover?( subject ).should be_true } 
  end

end # Array

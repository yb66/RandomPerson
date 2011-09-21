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

  describe :index_in_range do
    context "Given an number" do
      let(:max) { 99 }
      let(:array) {
        array = []
        i = 0
        until i >= max 
          last = array.empty? ? 0 : array.last.max + 1
          i = (i == 0 ? rand(99) : rand(max - i)) + last 
          array << (last..i)
        end
        array
      }
      context "That is not in the ranges in the array" do
        let(:n) { max + 1}
        subject{ array.index_in_range( n ) }
        it { should be_nil }
      end
      context "That is in the ranges in the array" do
        0.upto(99) do |n|
          subject{ array.index_in_range( n ) }
          it { subject.should_not be_nil }
          it { should be_a_kind_of Integer}
          it { should be_between( 0, array.length - 1 ) }
        end
      end
    end
  end # :index_in_range
    

end # Array

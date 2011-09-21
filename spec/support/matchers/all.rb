# encoding: UTF-8

require "rspec/expectations"

RSpec::Matchers.define :all_be_a_kind_of do |kind|
  match do |actual|
    all_kind_of? actual, kind
  end

  def all_kind_of?( collection, kind )
    collection.all? {|c| c.kind_of? kind }
  end

end

# encoding: UTF-8

require "rspec/expectations"

RSpec::Matchers.define :be_in do |collection|
  match do |actual|
    collection.include? actual
  end
end

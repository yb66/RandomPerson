# encoding: UTF-8

require "rspec"
require 'simplecov'
#require_relative "./support/helpers.rb"

SimpleCov.start

RSpec.configure do |c|
#  c.include RandomPerson::Spec::Helpers
#  c.treat_symbols_as_metadata_keys_with_true_values = true
end

spec_dir = File.expand_path( File.dirname __FILE__ )
Dir[ File.join( spec_dir, "/support/**/*.rb")].each {|f| require f}

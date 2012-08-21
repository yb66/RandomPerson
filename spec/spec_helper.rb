# encoding: UTF-8

require "rspec"
Spec_dir = File.expand_path( File.dirname __FILE__ )

unless Kernel.respond_to?(:require_relative)
  module Kernel
    def require_relative(path)
      require File.join(File.dirname(caller[0]), path.to_str)
    end
  end
end

require 'simplecov'
SimpleCov.start do
  add_filter "/vendor/"
  add_filter "/bin/"
  add_filter "/spec/"
end

RSpec.configure do |c|
#  c.include RandomPerson::Spec::Helpers
 c.treat_symbols_as_metadata_keys_with_true_values = true
end

Dir[ File.join( Spec_dir, "/support/**/*.rb")].each {|f| require f}

require "logger"
lg = Logger.new STDOUT
lg.level = Logger::DEBUG
Lg = lg



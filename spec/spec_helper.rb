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
  add_filter "/vendor.noindex/"
end

if ENV["DEBUG"]
  require 'pry-byebug'
  binding.pry
end


RSpec.configure do |c|
 c.treat_symbols_as_metadata_keys_with_true_values = true
end

Dir[ File.join( Spec_dir, "/support/**/*.rb")].each {|f| require f}

require "logger"
lg = Logger.new STDOUT
lg.level = Logger::DEBUG
Lg = lg



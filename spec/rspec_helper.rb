# encoding: UTF-8

require "rspec"

spec_dir = File.expand_path( File.dirname __FILE__ )
Dir[ File.join( spec_dir, "/support/**/*.rb")].each {|f| require f}

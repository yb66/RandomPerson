# -*- encoding: utf-8 -*-
require File.expand_path( '../lib/randomperson/version', __FILE__ )

Gem::Specification.new do |s|
  s.authors         = ["Iain Barnett"]
  s.email           = ["iainspeed@gmail.com"]
  s.license         = "MIT"
  s.description = <<-EOF
    RandomPerson is a port to Ruby of Perl's Data::RandomPerson. Use it to generate random persons given various parameters, such as country, age and gender ratio.
  EOF
  s.summary         = "A gem for generating random persons :)"
  s.homepage        = "http://github.com/yb66/RandomPerson"

  s.files 	        = `git ls-files`.split($\) 
  s.executables     = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files      = s.files.grep(%r{^(test|spec|features)/})
  s.name            = "randomperson"
  s.require_paths   = ['lib']
  s.version         = RandomPerson::VERSION
  s.add_development_dependency( "wirble" )
  s.add_development_dependency( "rspec" )
  s.add_development_dependency( "rake" )
  s.add_development_dependency( "simplecov" )
  s.add_development_dependency( "yard" )
  s.add_development_dependency( "redcarpet" ) # for yard
  s.required_ruby_version    = ">= 1.9.1"
end

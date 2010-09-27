# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)


Gem::Specification.new do |s|
  s.name           = "randomperson"
  s.summary        = "A gem for generating random persons :)"
  s.version        = "0.0.10"
  s.platform       = Gem::Platform::RUBY
  s.require_paths  << 'ext'
  s.required_ruby_version    = ">= 1.9.1"
  s.author         = "Iain Barnett"
  s.files          = ['Rakefile', 'randomperson.gemspec']
  s.files          += Dir['lib/**/*.rb']
  s.homepage       = "http://github.com/yb66/RandomPerson"
  s.email          = "iainspeed @nospam@ gmail.com"
  s.test_files     = Dir.glob('test/*.t')
end

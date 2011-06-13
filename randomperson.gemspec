# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)


Gem::Specification.new do |s|
  s.name           = "randomperson"
  s.summary        = "A gem for generating random persons :)"
  s.description = <<-EOF
    RandomPerson is a port to Ruby of Perl's Data::RandomPerson. Use it to generate random persons given various parameters, such as country, age and gender ratio.
  EOF
  s.version        = RandomPerson::VERSION 
  s.platform       = Gem::Platform::RUBY
  s.require_paths  << 'ext'
  s.required_ruby_version    = ">= 1.9.1"
  s.author         = "Iain Barnett"
  s.files 	   = `git ls-files`.split("\n") 
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.homepage       = "http://github.com/yb66/RandomPerson"
  s.email          = "iainspeed @nospam@ gmail.com"
  s.signing_key    = ENV['HOME'] + '/.ssh/gem-private_key.pem'
  s.cert_chain     = [ENV['HOME'] + '/.ssh/gem-public_cert.pem']
end

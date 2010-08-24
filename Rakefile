require 'rake'
require 'echoe'
# require 'rake/testtask'


Echoe.new('randomperson', '0.0.3') do |p|
  p.description    = "A gem for generating random persons"
  p.url            = "http://github.com/yb66/RandomPerson"
  p.author         = "Iain Barnett"
  p.email          = "iainspeed @nospam@ gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
  p.runtime_dependencies = []
  p.ruby_version   = ">= 1.9.1"
  p.require_signed = true
end

# task :default => [:test_units]
# 
# desc "Run basic tests"
# Rake::TestTask.new("test_units") { |t|
#   t.pattern = 't/*.t'
#   t.verbose = true
#   t.warning = true
# }

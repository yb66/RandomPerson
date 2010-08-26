require 'rake'
require 'echoe'
# require 'rake/testtask'

lib_dir = File.expand_path('lib')
test_dir = File.expand_path('t')

Echoe.new('randomperson', '0.0.9') do |p|
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


# desc "Run basic tests"
Rake::TestTask.new("test") { |t|
  t.libs = [lib_dir, test_dir]
  t.pattern = 't/*.t'
  t.verbose = true
  t.warning = true
}

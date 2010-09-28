require 'rake'
require 'rake/testtask'

lib_dir = File.expand_path('lib')
app_dir = File.expand_path('lib/randomperson')
test_dir = File.expand_path('test')
ext_dir = File.expand_path('lib/randomperson/ext')


# desc "Run basic tests"
Rake::TestTask.new("test") do |t|
  t.libs = [lib_dir, test_dir, app_dir]
  t.pattern = 'test/test_*.rb'
  t.verbose = true
  t.warning = true
end

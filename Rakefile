require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'test/unit/**/*.rb'
  t.libs.push 'test'
end

task :default => :test

require 'rake'
require 'rake/testtask'

require 'test/test_helper'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
  t.libs.push 'test'
end

task :default => :test

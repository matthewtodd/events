require 'cucumber/rake/task'
require 'rake/testtask'

Cucumber::Rake::Task.new

Rake::TestTask.new do |task|
  task.test_files = FileList['test/*_test.rb']
end

task :default => [:test, :features]

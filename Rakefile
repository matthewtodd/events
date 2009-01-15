require 'cucumber/rake/task'
require 'rake/clean'
require 'rake/rdoctask'
require 'rake/testtask'
require 'rubygems'

task :default => [:test, :features]

spec = Gem::Specification.new do |spec|
  spec.name             = 'events'
  spec.version          = '0.1.0'
  spec.summary          = 'Lists upcoming birthdays and anniversaries from your OSX Address Book.'
  spec.files            = FileList['*.rdoc', 'bin/*', 'lib/**/*.rb'].to_a
  spec.has_rdoc         = true
  spec.rdoc_options     = %W[--main README.rdoc --title #{spec.name}-#{spec.version} --inline-source --line-numbers]
  spec.extra_rdoc_files = FileList['*.rdoc', 'bin/*'].to_a
  spec.executables      = ['events']
  spec.author           = 'Matthew Todd'
  spec.email            = 'matthew.todd@gmail.com'
  spec.requirements    << 'RubyCocoa'
end

desc 'Generate a gemspec file'
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end

desc 'Generate documentation for the events gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'docs'
  rdoc.options    = spec.rdoc_options
  rdoc.rdoc_files = spec.files
end

Cucumber::Rake::Task.new

Rake::TestTask.new do |task|
  task.test_files = FileList['test/*_test.rb']
end

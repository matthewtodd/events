# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{events}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Todd"]
  s.date = %q{2009-01-17}
  s.default_executable = %q{events}
  s.email = %q{matthew.todd@gmail.com}
  s.executables = ["events"]
  s.extra_rdoc_files = ["README.rdoc", "bin/events"]
  s.files = ["README.rdoc", "bin/events", "features/events.feature", "features/steps/events.rb", "lib/events/address_book/fake.rb", "lib/events/address_book/real.rb", "lib/events/address_book.rb", "lib/events/cli.rb", "lib/events/person.rb", "lib/events/recurring_date.rb", "lib/events.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.rdoc", "--title", "events-0.1.0", "--inline-source", "--line-numbers"]
  s.require_paths = ["lib"]
  s.requirements = ["RubyCocoa"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Lists upcoming birthdays and anniversaries from your OSX Address Book.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

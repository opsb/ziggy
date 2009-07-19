# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ziggy}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Oliver Searle-Barnes"]
  s.date = %q{2009-07-19}
  s.description = %q{ziggy can be used to cache any method on any class and allows custom keys and expiration times}
  s.email = %q{oliver@opsb.co.uk}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    "LICENSE",
     "README.markdown",
     "RakeFile",
     "VERSION.yml",
     "init.rb",
     "lib/ziggy.rb",
     "rails/init.rb",
     "ziggy.gemspec"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/opsb/ziggy}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Cache any method on any class}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

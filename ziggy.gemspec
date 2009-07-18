# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ziggy}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Oliver Searle-Barnes"]
  s.date = %q{2009-07-18}
  s.description = %q{Ziggy allow caching of any method on any class using rails.cache}
  s.email = %q{oliver@opsb.co.uk}
  s.files = ["lib/ziggy.rb"]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/opsb/ziggy}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Ziggy allows caching of any method on any class using rails.cache}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 1.15"])
      s.add_runtime_dependency(%q<diff-lcs>, [">= 1.1.2"])
    else
      s.add_dependency(%q<mime-types>, [">= 1.15"])
      s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 1.15"])
    s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
  end
end

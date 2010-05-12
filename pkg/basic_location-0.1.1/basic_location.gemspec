# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{basic_location}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adrian Cuadros"]
  s.date = %q{2010-05-12}
  s.description = %q{Generate basic location information for any given model}
  s.email = %q{adrian@innku.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/basic_location.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/basic_location.rb", "Manifest", "basic_location.gemspec"]
  s.homepage = %q{http://github.com/adriancuadros/basic_location}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Basic_location", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{basic_location}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Generate basic location information for any given model}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

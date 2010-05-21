require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "belongs_to_city"
    gemspec.summary = "Eases integrating a city database structure with any model in rails"
    gemspec.description = "Creates the basic structure to enable integration with any model and eases autocomplete search"
    gemspec.email = "adrian@innku.com"
    gemspec.homepage = "http://github.com/adriancuadros/belongs_to_city"
    gemspec.authors = ["Adrian Cuadros"]
    gemspec.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gemspec.add_development_dependency "searchlogic"
    gemspec.add_development_dependency "fastercsv"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

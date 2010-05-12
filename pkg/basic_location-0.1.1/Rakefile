require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('basic_location', '0.1.1') do |p|
  p.description     = "Generate basic location information for any given model"
  p.url             = "http://github.com/adriancuadros/basic_location"
  p.author          = "Adrian Cuadros"
  p.email           = "adrian@innku.com"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each{|ext| load ext }
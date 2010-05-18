require 'rubygems'
require 'fastercsv'

namespace :db do
  namespace :seed do
    task :belongs_to_city => :environment do
      FasterCSV.foreach('db/csv/countries.csv') do |country|
        puts country.name
      end
    end
  end
end
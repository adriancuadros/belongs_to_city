require 'fastercsv'

namespace :belongs_to_city do
  desc "Get all the city information from db/csv"
  task :seed => :environment do
    FasterCSV.foreach('db/csv/countries.csv') do |country|
      puts country.name
    end
  end
end
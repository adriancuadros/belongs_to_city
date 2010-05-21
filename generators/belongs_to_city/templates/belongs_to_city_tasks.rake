require 'rubygems'
require 'fastercsv'

namespace :db do
  namespace :seed do
    task :cities => :environment do
      
      puts 'Creating countries...'
      FasterCSV.foreach('db/csv/countries.csv', :headers => :first_row) do |country|
        Country.create(:name => country['name'])
      end
      puts 'done'
      
      puts 'Creating States'
      FasterCSV.foreach('db/csv/states.csv', :headers => :first_row) do |state|
        State.create(:country_id => state['country_id'], :name => state['name'], :abbr => state['abbr'], :short => state['short'], :short2 => state['short2'])
      end
      puts 'done'
      
      puts 'Creating Cities'
      FasterCSV.foreach('db/csv/cities.csv', :headers => :first_row) do |city|
        City.create(:state_id => city['state_id'], :name => city['name'], :city_name => city['city_name'])
      end
      puts 'Done'
    end
  end
end
class BelongsToCityGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template "migrate/create_belongs_to_city_tables.rb", "db/migrate", :migration_file_name => "create_basic_location_tables"
      m.template "models/country.rb", "app/models"
      m.template "models/state.rb", "app/models"
      m.template "models/city.rb", "app/models"
    end
  end
end

class BelongsToCityGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template "migrate/create_belongs_to_city_tables.rb", "db/migrate", :migration_file_name => "create_belongs_to_city_tables"
      m.template "models/country.rb", "app/models/country.rb"
      m.template "models/state.rb", "app/models/state.rb"
      m.template "models/city.rb", "app/models/city.rb"
    end
  end
end

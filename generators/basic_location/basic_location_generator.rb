class BasicLocationGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template "migrate/create_basic_location_tables.rb", "db/migrate", :migration_file_name => "create_basic_location_tables"
    end
  end
end

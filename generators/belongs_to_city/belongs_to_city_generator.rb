class BelongsToCityGenerator < Rails::Generator::Base
  attr_accessor :models, :controller, :tables, :seed
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage if (!@args.empty? and (['tables', 'models', 'controller', 'seed'] - @args).size == 4)
  end
  
  def manifest
      record do |m|
        if @args.empty? or @args.include?('tables')
          m.migration_template "migrate/create_belongs_to_city_tables.rb", "db/migrate", :migration_file_name => "create_belongs_to_city_tables"
        end
        if @args.empty? or @args.include?('models')
          m.template "models/country.rb", "app/models/country.rb"
          m.template "models/state.rb", "app/models/state.rb"
          m.template "models/city.rb", "app/models/city.rb"
        end
        if @args.empty? or @args.include?('controller') 
          m.template "controllers/cities_controller.rb", "app/controllers/cities_controller.rb"
          m.directory "app/views/cities"
          m.file      "views/index.js.erb", "app/views/cities/index.js.erb"
        end
        if options[:include_seeds]
          puts 'yes'
          m.directory "db/csv"
          m.file      "countries.csv", "db/csv/countries.csv"
          m.file      "states.csv",    "db/csv/states.csv"
          m.file      "cites.csv",     "db/csv/cites.csv"
        end
      end
  end
  
  protected
  
  def banner
    <<-EOS
      "#{$0}"
    EOS
  end
  
  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on('--include-seeds', "Include seed template files on db/csv") { |v| options[:include_seeds] = true }
  end
  
end

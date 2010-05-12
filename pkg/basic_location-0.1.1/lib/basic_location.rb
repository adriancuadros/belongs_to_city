module BasicLocation
  self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    
    def basic_location_as(*args)
      city_attribute = args.first.to_s
      
      define_method "#{city_attribute}_name" do
        if (send city_attribute)
          return read_attribute("#{city_attribute}_name") || "#{send(city_attribute).name}, #{send(city_attribute).state.short2}"
        end
      end

      define_method "#{city_attribute}_name=" do |city_name|
        write_attribute(city_attribute, city_name)
        @cities = City.find_by_full_name(city_name)
        if @cities.size == 1
          send "#{city_attribute}=", @cities.first
        else
          send "#{city_attribute}=", nil
        end
      end
      
    end
    
  end
  
end

class ActiveRecod::Base
  include BasicLocation
end
module BelongsToCity
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    
    def belongs_to_city(*args)
      city_attribute = args.first[:as].to_s
      city_collector = city_attribute.to_s.pluralize.to_sym
      attr_accessor city_collector
      belongs_to    city_attribute, :class_name => "City", :foreign_key => 'city_id'
      
      define_method "#{city_attribute}_name" do
        if (send city_attribute)
          return read_attribute("#{city_attribute}_name") || "#{send(city_attribute).name}, #{send(city_attribute).state.short2}"
        end
      end

      define_method "#{city_attribute}_name=" do |city_name|
        write_attribute(city_attribute, city_name)
        write_attribute(city_collector, City.find_by_full_name(city_name))
        if read_attribute(city_collector).size == 1
          send "#{city_attribute}=", read_attribute(city_collector).first
        else
          send "#{city_attribute}=", nil
        end
      end
      
    end
    
  end
  
end

class ActiveRecord::Base
  include BelongsToCity
end
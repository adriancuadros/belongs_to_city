module BelongsToCity
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    
    def belongs_to_city(*args)
      city_attribute = args.empty? ? :city : args.first[:as]
      city_attribute_helper = (city_attribute.to_s + '_name').to_sym
      city_collector = city_attribute.to_s.pluralize.to_sym
      attr_accessor city_collector
      belongs_to    city_attribute, :class_name => "City", :foreign_key => 'city_id'
      
      #Getter and Setter Methods
      define_method "#{city_attribute}_name" do
        return read_attribute("#{city_attribute}_name") if read_attribute("#{city_attribute}_name")
        return "#{send(city_attribute).name}, #{send(city_attribute).state.short2}" if read_attribute(city_attribute)
      end

      define_method "#{city_attribute}_name=" do |city_name|
        write_attribute("#{city_attribute}_name", city_name)
        write_attribute(city_collector, City.find_by_full_name(city_name) || [])
        if read_attribute(city_collector).size == 1
          send "#{city_attribute}=", read_attribute(city_collector).first
        else
          send "#{city_attribute}=", nil
        end
      end
      
      #Validation Methods
      if args[:required]
        if args[:messages]
          too_many_cities_message = args[:messages][:on_many_matches]
          no_cities_message = args[:messages][:on_no_matches]
        end
        too_many_cities_message ||="Too many cities found in your request, please be more specific"
        no_cities_message ||= "We couldn't find any city in your request"
        validate do 
          errors.add(city_attribute_helper, too_many_cities_message) if read_attribute(city_collector).size > 1
          errors.add(city_attribute_helper, no_cities_message) if read_attribute(city_collector).size == 0
        end
      end
      
    end
    
  end
  
end

class ActiveRecord::Base
  include BelongsToCity
end
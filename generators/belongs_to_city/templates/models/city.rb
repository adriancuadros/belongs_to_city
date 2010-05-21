class City < ActiveRecord::Base
  belongs_to      :state
  
  def self.find_by_full_name(full_name)
    unless full_name.blank?
      city_name, state_name = full_name.split(",")
      @cities = City.name_is(city_name.strip)
      @cities = @cities.state_name_or_state_abbr_like(state_name.strip) if state_name
      @cities
    else
      []
    end
  end
  
end
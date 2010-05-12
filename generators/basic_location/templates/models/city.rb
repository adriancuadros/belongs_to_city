class City < ActiveRecord::Base
  belongs_to      :state
  named_scope     :state_like, lambda {|name| {:include => [:state], :conditions => ["states.name = ? or states.abbr = ?",name, name]}}
  
  #TODO change searchlogic to default rails
  def self.find_by_full_name(full_name)
    unless full_name.blank?
      city_name, state_name = full_name.split(",")
      @cities = City.all(:conditions => {:name => city_name.strip})
      if state_name and state_name.strip.size > 2
        @cities = @cities.state_like(state_name.strip) 
      elsif state_name
        @cities = @cities.state_abbr_is(state_name.strip.upcase) 
      end
      @cities
    else
      []
    end
  end
  
end
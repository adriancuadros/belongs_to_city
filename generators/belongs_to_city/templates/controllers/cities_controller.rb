class CitiesController < ApplicationController
  def index
    @cities = City.city_name_or_name_like(params[:q])
    respond_to do |format|
      format.js {  }
    end
  end
end
class BeautyPlacesController < ApplicationController
  def index
    # get the current users location
    query_validator = create_query_validator
    if query_validator.valid?
      query_string = params[:type] + " near " + params[:current_location] 
      beauty_places = google_places.spots_by_query(query_string)
      render json: beauty_places
    else
      render json: errors
    end
  end
end

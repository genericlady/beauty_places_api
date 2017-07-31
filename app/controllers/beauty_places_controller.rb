class BeautyPlacesController < ApplicationController
  def index
    query_validator = create_query_validator
    if query_validator.valid?
      if params.key?(:coords)
        query_string = params[:type] + " near " + current_city_state
        beauty_places = google_places.spots_by_query(query_string)
      else
        beauty_places = []
      end
      render json: beauty_places
    else
      render json: query_validator.errors
    end
  end

  def details
    render json: google_places.spot(place_id)
  end

  private
  def place_id
    if params.key?(:place_id)
      params[:place_id]
    end
  end

end

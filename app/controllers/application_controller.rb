class ApplicationController < ActionController::API
  def google_places
    @google_places ||= GooglePlaces::Client.new(ENV.fetch('LOCATE_BEAUTY_GOOGLE'))
  end

  def create_query_validator
    QueryValidator.new(params)
  end

  def current_location
    @current_location ||= CurrentLocation.new(current_location_params)
  end

  def current_location_params
    coords = params[:coords].split(" ")
    {
      latitude: coords[0],
      longitude: coords[1]
    }
  end

end

class ApplicationController < ActionController::API
  def google_places
    @google_places ||= GooglePlaces::Client.new(ENV.fetch('LOCATE_BEAUTY_GOOGLE'))
  end

  def create_query_validator
    QueryValidator.new(params)
  end
end

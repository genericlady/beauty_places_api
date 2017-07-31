class CurrentLocationController < ApplicationController
  def show
    render json: Coordinates.new(coordinate_params).reverse_geocode
  end

  private
  def coordinate_params
    coords = params[:coords].split(" ")
    {
      latitude: coords[0],
      longitude: coords[1]
    }
  end
end

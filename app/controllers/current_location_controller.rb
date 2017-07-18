class CurrentLocationController < ApplicationController
  def show
    render json: Rack.request.location
  end
end

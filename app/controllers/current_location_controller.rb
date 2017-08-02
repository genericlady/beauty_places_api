class CurrentLocationController < ApplicationController
  def show
    render json: current_location.to_h
  end
end

class CurrentLocation < ActiveRecord::Base
  attr_accessor :address

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def city_state_zip
    @city_state_zip ||= location_details[1..2].join(", ")
  end

  def city_state
    city_state_zip.split(/\,\ /)[0] + ", " +
    city_state_zip.split(/\,\ /)[1].split(" ").first
  end

  def location_details
    @location_details ||= self.fetch_address.split(", ")
  end

  def to_h
    city = city_state_zip.split(/\,\ /)[0]
    state = city_state_zip.split(/\,\ /)[1].split(" ").first

    { city: city, state: state }
  end

end

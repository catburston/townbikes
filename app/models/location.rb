class Location < ActiveRecord::Base
  belongs_to    :user
  validates     :user_id, presence: true
  validates     :city, presence: true
  validates     :country, presence: true

  include ApplicationHelper

  # instruct Geocoder gem which method returns your object's geocodable address:
  geocoded_by :full_street_address
  # For reverse geocoding, instruct Geocoder gem which attributes store latitude and longitude, and where to store the address
  reverse_geocoded_by :latitude, :longitude, address: :result

  after_validation :complete_location

  def address
    [street_name, city, post_code, state, country].compact.join(', ').presence
  end

  def coordinates
    if latitude.present? && longitude.present?
      { latitude: latitude, longitude: longitude }
    else
      {}
    end
  end

  def self.markers(locations)
    Gmaps4rails.build_markers(locations) do |location, marker|
      marker.lat          location.latitude
      marker.lng          location.longitude
      marker.title        "Location HERE"
      marker.infowindow   info_content(location)
    end.to_json
  end

  def self.search(query)
    near_by_locations = Location.near("%#{query}%", 100)
  end

  private

  def full_street_address
    search || address
  end

  def complete_location
    if full_street_address.present? && coordinates.empty?
      geocode
    elsif coordinates.present? && result.blank?
      reverse_geocode
    end
  end

  def  self.info_content(location)
    (location.result || location.address || location.search) + "<br /><a href='/locations/#{location.id}'>See all bicycles</a><br />" + location_bicycles(location).compact.join(', ')
  end

  def self.location_bicycles(location)
    arr = []

    location.user.bicycles.each do |b|
      arr << b.manufacturer
    end

    arr

  end

end
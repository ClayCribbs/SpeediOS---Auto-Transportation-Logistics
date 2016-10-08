class Vehicle < ApplicationRecord
	before_save :geocode_endpoints


  def address
    origin.to_s
    destination.to_s
  end

  def geocode_endpoints

    if origin_changed?
      geocoded = Geocoder.search(origin).first
      if geocoded
        self.origin_latitude = geocoded.latitude
        self.origin_longitude = geocoded.longitude
      end
    end

    if destination_changed?
    	geocoded = Geocoder.search(destination).first
      if geocoded
        self.destination_latitude = geocoded.destination_latitude
        self.destination_latitude = geocoded.destination_longitude
      end
    end

  end

end

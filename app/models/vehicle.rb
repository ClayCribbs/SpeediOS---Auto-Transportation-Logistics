class Vehicle < ApplicationRecord

	mount_uploader :image, ImageUploader
  before_save :geocode_endpoints

  private
  #To enable Geocoder to works with multiple locations
  def geocode_endpoints
      geocoded = Geocoder.search(:origin).first
      if geocoded
        self.origin_latitude = geocoded.latitude
        self.origin_longitude = geocoded.longitude
      end

      geocoded = Geocoder.search(:destination).first
      if geocoded
        self.destination_latitude = geocoded.latitude
        self.destination_longitude = geocoded.longitude
      end
  end

	def image_from_url(url)
    self.image = open(url)
  end

end

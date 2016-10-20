class Vehicle < ApplicationRecord
	mount_uploader :image, ImageUploader


	def image_from_url(url)
    self.image = open(url)
  end

end

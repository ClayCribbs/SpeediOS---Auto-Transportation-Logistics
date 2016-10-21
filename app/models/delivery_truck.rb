class DeliveryTruck < ApplicationRecord

	mount_uploader :image, ImageUploader
	has_many :orders

end

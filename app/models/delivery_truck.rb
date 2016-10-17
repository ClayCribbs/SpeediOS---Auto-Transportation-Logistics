class DeliveryTruck < ApplicationRecord

	has_many :vehicles
	
	mount_uploader :image, ImageUploader


end

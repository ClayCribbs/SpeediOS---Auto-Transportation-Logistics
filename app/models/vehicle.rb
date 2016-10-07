class Vehicle < ApplicationRecord

	geocoded_by :address, :latitude  => :origin_latitude, :longitude => :origin_longitude 
  after_validation :geocode

  def address
    "#{origin}"
  end

end

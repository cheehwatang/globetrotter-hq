class Flat < ApplicationRecord
  validates :name, :address, :description, :price_per_night, :number_of_guests, :picture_url, presence: true
  validates :price_per_night, :number_of_guests, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

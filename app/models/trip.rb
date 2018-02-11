class Trip < ApplicationRecord
  validates_presence_of :start_address, :destination_address, :price, :date

  scope :total_distance, -> (range) { select{ |trip| range.cover?(trip.date) }.pluck(:distance).sum }
  scope :total_price, -> (range) { select{ |trip| range.cover?(trip.date) }.pluck(:price).sum }
end

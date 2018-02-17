class Trip < ApplicationRecord
  validates_presence_of :start_address, :destination_address, :price, :date

  scope :all_trips, -> (range) { select{ |trip| range.cover?(trip.date) } }
end

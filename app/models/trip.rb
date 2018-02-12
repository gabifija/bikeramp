class Trip < ApplicationRecord
  validates_presence_of :start_address, :destination_address, :price, :date

  scope :total_distance, -> (range) { select{ |trip| range.cover?(trip.date)
                                    }.pluck(:distance).sum }

  scope :total_price, -> (range) { select{ |trip| range.cover?(trip.date)
                                 }.pluck(:price).sum }

  scope :all_occured_trips, -> (range) { select{ |trip| range.cover?(trip.date)
                                       }.group_by { |d| d.date
                                       }.values.flatten.map(&:date).uniq }

  scope :total_distance_per_day, -> (date) { where(date: date).sum(:distance) }

  scope :average_ride, -> (date) { where(date: date).average(:distance) }

  scope :average_price, -> (date) { where(date: date).average(:price) }


  def self.convert_date(date)
    date.to_time.strftime("%b, #{date.day.ordinalize}")
  end

  def self.count_total_distance(date)
    distance = Trip.total_distance_per_day(date)
    ActionController::Base.helpers.number_to_human(distance, units: {unit: "km"})
  end

  def self.count_average_ride(date)
    ride = Trip.average_ride(date)
    ActionController::Base.helpers.number_to_human(ride, units: {unit: "km"})
  end

  def self.count_average_price(date)
    price = Trip.average_price(date)
    ActionController::Base.helpers.number_to_human(price, units: {unit: "PLN"})
  end
end

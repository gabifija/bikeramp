class Trip < ApplicationRecord
  validates_presence_of :start_address, :destination_address, :price, :date

  scope :total_distance, -> (range) { select{ |trip| range.cover?(trip.date)
                                    }.pluck(:distance).sum }

  scope :total_price, -> (range) { select{ |trip| range.cover?(trip.date)
                                 }.pluck(:price).sum }

  scope :all_occured_trips, -> (range) { select{ |trip| range.cover?(trip.date)
                                       }.group_by { |d| d.date
                                       }.values.flatten.map(&:date).uniq }

  def self.convert_date(date)
    date.to_time.strftime("%b, #{date.day.ordinalize}")
  end  
end

class API::StatsController < ApplicationController
  include ExceptionHandler
  include Response

  def show_weekly
    range = (Date.today-1.week..Date.today)

    data = {
        total_distance: Trip.total_distance(range),
        total_price: Trip.total_price(range)
      }

    json_response(data)
  end

  def show_monthly
    range = (Date.today.beginning_of_month..Date.today.end_of_month)

    @dates = Trip.all_occured_trips(range)

    data ||= []

    @dates.each do |date|
      data << {
        day: Trip.convert_date(date),
        total_distance: Trip.count_total_distance(date),
        avg_ride: Trip.count_average_ride(date),
        avg_price: Trip.count_average_price(date)
      }
    end
    json_response(data)
  end
end

class API::StatsController < ApplicationController
  include ExceptionHandler
  include Response

  def show_weekly
    range = (Date.today-1.week..Date.today)

    data = {
        total_distance: calculate_distance(range),
        total_price: calculate_price(range)
      }

    json_response(data)
  end

  def show_monthly
    range = (Date.today-1.month..Date.today)
    render json: {}
  end

  private
    def calculate_distance(range)
      Trip.all.select{ |trip| range.cover?(trip.date) }.pluck(:distance).sum
    end

    def calculate_price(range)
      Trip.all.select{ |trip| range.cover?(trip.date) }.pluck(:price).sum
    end
end

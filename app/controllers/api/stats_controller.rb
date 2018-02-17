class API::StatsController < ApplicationController
  include ExceptionHandler
  include Response

  def show_weekly
    range = (Date.today-1.week..Date.today)
    @trips = Trip.all_trips(range)

    render json: TripsWeeklyPresenter.new(@trips)
  end

  def show_monthly
    range = (Date.today.beginning_of_month..Date.today.end_of_month)
    @trips = Trip.all_trips(range)

    render json: TripsMonthlyPresenter.new(@trips)
  end
end

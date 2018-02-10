class API::TripsController < ApplicationController
  include ExceptionHandler
  include Response

  before_action :set_trip, only: [:show, :update, :destroy]

  # GET /api/trips
  def index
    @trips = Trip.all
    json_response(@trips)
  end

  # GET /api/trips/1
  def show
    json_response(@trip)
  end

  # POST /api/trips
  def create
    return json_response({
      message: 'Wrong start or destination address'}, :bad_request) unless is_valid_address?

    return json_response({
      message: 'Wrong date format. For example: 01/12/2016'}, :bad_request) unless is_valid_date?

    @trip = Trip.create!(trip_params)
    @trip.update_attribute(:distance, count_distance_between_addresses)

    json_response(@trip, :created)
  end

  # PATCH/PUT /api/trips/1
  def update
    @trip.update(trip_params)
    head :no_content
  end

  # DELETE /api/trips/1
  def destroy
    @trip.destroy
    head :no_content
  end

  private

    def is_valid_date?
      return true if Date.parse(params[:date])
      rescue ArgumentError
        return false
    end

    def is_valid_address?
      @start_address = Geocoder.coordinates(params[:start_address])
      @destination_address = Geocoder.coordinates(params[:destination_address])

      return false if @start_address.nil? || @destination_address.nil?
      return true
    end

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.permit(:start_address, :destination_address, :price, :date)
    end

    def count_distance_between_addresses
      Geocoder::Calculations.distance_between(@start_address, @destination_address)
    end
end

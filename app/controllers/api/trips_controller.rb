class API::TripsController < ApplicationController
  include ExceptionHandler
  include Response

  before_action :set_trip, only: [:show, :update, :destroy]

  # GET /trips
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
    @trip = Trip.create!(trip_params)
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
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.permit(:start_address, :destination_address, :price, :date)
    end
end

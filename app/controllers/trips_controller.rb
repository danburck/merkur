class TripsController < ApplicationController
  before_action :set_trips

  def index
    @trips = Trips.all
  end

  def show; end


  def create
    @body = Body.find(params[:body_id])
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.travel_cost = @body.cost_per_day
    @booking
     if @trip.save
      redirect_to home_path(@bodies)
    else
      render 'new'
    end
  end

  def new
    @body = Body.find(params[:body_id])
    @trip = Trip.new
  end


 private

  def review_params
    params.require(:bodie).permit(:arrival_date, :departure_date)
  end


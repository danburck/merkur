class TripsController < ApplicationController
  # before_action :set_trips

  def new
    @trip = Trip.new
    @body = Body.find(params[:body_id])
    @user = current_user
  end

  def create
    @body = Body.find(params[:body_id])
    @user = current_user
    @trip = Trip.new(trip_params)
    @trip.body = @body
    @trip.user = @user
    if @body.save
      redirect_to root_path
    else
      render :new
   end
  end

  def index
    @trips = Trips.all
  end

  def show; end

 private

  def trip_params
    params.require(:trip).permit(:arrival_date, :departure_date, :starship, :travel_cost, :)
  end
end

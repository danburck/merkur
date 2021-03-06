class TripsController < ApplicationController
  def index
    @trips = Trip.where(user: current_user)
  end

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
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:arrival_date, :departure_date, :body_id, :user_id)
  end
end

class TripsController < ApplicationController

  def show
    @trip = Trip.find(params[:id])
  end
  def create
    @trip = Trip.new(trip_params)
    @trip.body_id = params[:body_id]
    @trip.user = current_user

    if @dtrip.save
      redirect_to trip_path(params[:trip_id])
    else
      render :new
    end
  end

  def trip_params
    params.require(:trip).permit(:arrival_date, :departure_date, :user_id, :body_id, :travel_cost, :starship)
  end
end

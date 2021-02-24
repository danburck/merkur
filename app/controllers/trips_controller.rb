class TripsController < ApplicationController
  before_action :set_trips

  def index
    @trips = Trips.all
  end

  def show; end


  def create
    @trip = Trip.find(params[:id])
    @user = User.new(user_params)
    @user.trip = @user.body(body_param)
    @user.body = @user.costs_per_day

    end
  end

  def new
    @trip = Trip.new
  end


 private

  def review_params
    params.require(:bodie).permit(:arrival_date, :departure_date, :number_of_guests)
  end


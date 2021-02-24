class TripsController < ApplicationController
  def index
    @trips = Trip.where(user: current_user)
  end
end

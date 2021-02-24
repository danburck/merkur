class BodiesController < ApplicationController
	def index
		@bodies = Body.all
	end
  def show
    @body = Body.find(params[:id])
    @trip = Trip.new
  end
end

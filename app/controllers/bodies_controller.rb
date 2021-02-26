class BodiesController < ApplicationController
	def index
		if params[:query].present?
			@body = Body.search_by_name(params[:query])
      @bodies = Body.all
		else
      @body = Body.all
      @bodies = Body.all
    end
	end
  def show
    @body = Body.find(params[:id])
    @trip = Trip.new
    @bodies = Body.all
    @random_nearby_bodies = [@bodies.sample, @bodies.sample, @bodies.sample]
  end
end

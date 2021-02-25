class BodiesController < ApplicationController
	def index
		if params[:query].present?
			@bodies = Body.search_by_name_and_nearest_planet(params[:query])
		else
      @bodies = Body.all
    end
	end
  def show
    @body = Body.find(params[:id])
    @trip = Trip.new
  end
end

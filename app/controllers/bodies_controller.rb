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
    # @nearby_bodies = Body.search_by_nearest_planet(@body.name)
    @nearby_bodies = [Body.first, Body.second, Body.third]
  end
end

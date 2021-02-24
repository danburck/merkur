class BodiesController < ApplicationController
	def index
		@body = Body.all
	end
  	def show
    	@body = Body.find(params[:id])
  	end
end

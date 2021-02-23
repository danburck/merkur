class BodiesController < ApplicationController
  def show
    @body = Body.find(params[:id])
  end
end

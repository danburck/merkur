class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @moon =  Body.where(name: 'moon')
    @mars =  Body.where(name: 'mars')

    @bodies = if params[:query].present?
                Body.search_by_name_and_nearest_planet(params[:query])
              else
                Body.all
              end
  end
end

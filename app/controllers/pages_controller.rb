class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @bodies = Body.all
    @moon =  Body.where(name: 'moon')
    @mars =  Body.where(name: 'mars')
  end
end

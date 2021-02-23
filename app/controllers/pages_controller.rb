class PagesController < ApplicationController
  skip_before_action :authenticate_traveller!, only: :home
  def home
  end
end

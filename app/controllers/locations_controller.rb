class LocationsController < ApplicationController

  def index
    @user = current_user
    @locations = Location.where(id: params[:ids])
  end

  def show
    @user = current_user
  end

end
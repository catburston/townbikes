class LocationsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @user = current_user
    @locations = Location.where(id: params[:ids])

    if params[:user_id]
      @locations = Location.where(:user_id => params[:user_id])
    end
  end

  def show
    @user = current_user
    @location = Location.find(params[:id])
  end

  def new
    @user = current_user
    @location = Location.new
  end

  def create
    @user = current_user
    @location = Location.new location_params
    @location.user = current_user
    if @location.save
      redirect_to location_path(@location.id), notice: 'Location created'
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @location = Locaiton.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    location = @user.locations.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  def update
    @user = User.find(params[:user_id])
    @location = @user.locations.find(params[:id])
    if @location.update_attributes location_params
      redirect_to location_path(@location.id), notice: 'Location successfully updated'
    else
      # @errors = @location.errors.full_messages
      render 'edit'
    end
  end

  private
  def location_params
    params.require(:location).permit(:street_name, :suburb, :post_code, :city, :state, :country)
  end

end

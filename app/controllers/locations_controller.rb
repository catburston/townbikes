class LocationsController < ApplicationController
  # before_filter :authenticate_user!, except: [:index, :show]
  helper_method :view_context

  def index
    @user = current_user

    if params[:user_id]
      @locations = Location.where(:user_id => params[:user_id])
    elsif params[:search]
      @locations = Location.search(params[:search])
    else
      @locations = Location.all
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
    @location = Location.find(params[:id])
  end

  def destroy
    @user = User.find(current_user)
    location = @user.location.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  def update
    @user = User.find(current_user)
    @location = Location.find(params[:id])
    if @location.update_attributes location_params
      redirect_to location_path(@location.id), notice: 'Location successfully updated'
    else
      # @errors = @location.errors.full_messages
      render 'edit'
    end
  end

  private
  def location_params
    params.require(:location).permit(:street_name, :suburb, :post_code, :city, :state, :country, :latitude, :longitude, :user_id, :bicycle_id)
  end

end

class BicyclesController < ApplicationController
  # before_filter :authenticate_user!, except: [:index, :show]

  def index
    @user = current_user

    if params[:user_id].present?
      @bicycles = Bicycle.where(:user_id => current_user.id)
    else
      @bicycles = Bicycle.all
    end

  end

  def show
    @user = current_user
    @bicycle = Bicycle.find(params[:id])
    @owner = @bicycle.user
    @location = Location.find_by(:user_id => @owner.id)
  end

  def new
    @user = current_user
    @bicycle = Bicycle.new
  end

  def create
    @user = current_user
    @bicycle = Bicycle.new bicycle_params
    @bicycle.user = current_user
    if @bicycle.save
      redirect_to bicycle_path(@bicycle.id), notice: 'Bicycle was successfully listed'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @bicycle = Bicycle.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    bicycle = @user.bicycles.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  def update
    @user = User.find(params[:user_id])
    @bicycle = @user.bicycles.find(params[:id])
    if @bicycle.update_attributes bicycle_params
        redirect_to bicycle_path(@bicycle.id), notice: 'Bicycle was successfully updated'
    else
        # @errors = @bicycle.errors.full_messages
        render 'edit'
    end
  end

  def self.user_bicycles(current_user)
    where(user_id: current_user.id)
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:manufacturer, :bicycle_type, :size, :daily_cost, :description, :photo, :properties => [:helmet, :front_basket, :rear_basket, :trailer, :internal_gears, :child_seat])
  end

  def filtering_params(params)
    params.slice(:user_bicycles)
    # params.slice(:not_user_bicycles)
  end
end
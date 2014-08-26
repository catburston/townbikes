class BicyclesController < ApplicationController
  # before_filter :authenticate_user!, except: [:index, :show]

  def index
    if params[:user_id].present?
      @bicycles = Bicycle.where(:user_id => current_user.id)
    else
      @bicycles = Bicycle.all
    end

  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new bicycle_params
    @bicycle.user = current_user
    if @bicycle.save
      redirect_to bicycle_path(@bicycle.id), notice: 'Bicycle was successfully listed'
    else
      render :new
    end
  end

  def edit
    @bicycle = Bicycle.find(params[:id])
    if current_user != @bicycle.user
      redirect_to bicycle_path(@bicycle.id), notice: "You cannot edit a bicycle that you don't own"
    end
  end

  def update
    @bicycle = Bicycle.find(params[:id])
    if @bicycle.update_attributes bicycle_params
      redirect_to bicycle_path(@bicycle.id), notice: 'Bicycle was successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @bicycle = Bicycle.find(params[:id])
    if current_user == @bicycle.user
      @bicycle = Bicycle.find(params[:id]).destroy
      redirect_to bicycles_path
    else
      redirect_to bicycle_path(@bicycle.id), notice: "You cannot delete a bicycle that you don't own"
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
  end
end
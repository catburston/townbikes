class BicyclesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @bicycles = Bicycle.all
    @bicycles.each do |bicycle|
    @owner = bicycle.user
    @user = current_user
    end

    if params[:user_id]
      @bicycles = Bicycle.where(:user_id => params[:user_id])
    else
      @bicycles = Bicycle.all
    end
  end

  def show
    @user = current_user
    @bicycle = Bicycle.find(params[:id])
    @owner = @bicycle.user
  end

  def new
    @user = current_user
    @bicycle = Bicycle.new
  end

  def create
    @user = current_user
    @bicycle = Bicycle.new( bicycle_params )
    @bicycle.user = current_user
    if @bicycle.save
      redirect_to user_bicycles_path, notice: 'Bicycle was successfully listed'
    else
      render :new
    end
  end

  def self.user_bicycles(current_user)
    where(user_id: current_user.id)
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:manufacturer, :bicycle_type, :size, :daily_cost, :description, :properties)
  end

  def filtering_params(params)
    params.slice(:user_bicycles)
  end
end
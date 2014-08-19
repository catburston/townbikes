class BicyclesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @bicycles = Bicycle.all
    @bicycles.each do |bicycle|
    @owner = bicycle.user
    end

  end

  def show
    @bicycle = Bicycle.find(params[:id])
    @owner = @bicycle.user
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new( bicycle_params )
    @bicycle.user = current_user
    if @bicycle.save
      redirect_to user_bicycles_path, notice: 'Bicycle was successfully listed'
    else
      render :new
    end
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:manufacturer, :bicycle_type, :size, :daily_cost, :description, :properties)
  end
end
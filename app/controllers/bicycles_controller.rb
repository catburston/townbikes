class BicyclesController < ApplicationController
  def index
    @bicycles = Bicycle.all
  end

  def show
    @bicycle = Bicycle.find(params[:id])
    @user = @bicycle.user
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new( bicycle_params )
    @bicycle.user = current_user
    if @bicycle.save
      redirect_to bicycles_path, notice: 'Bicycle was successfully listed'
    else
      render :new
    end
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:manufacturer, :bicycle_type, :size, :daily_cost, :description, :properties)
  end
end
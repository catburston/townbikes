class BicyclesController < ApplicationController
  def index
    @bicycles = Bicycle.all
  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.create( bicycle_params )
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:manufacturer, :bicycle_type, :size, :daily_cost, :description, :properties)
  end
end
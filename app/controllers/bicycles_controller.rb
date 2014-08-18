class BicyclesController < ApplicationController
  def index
    @bicycles = Bicycle.all
  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end
end
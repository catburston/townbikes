class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @reservations.each do |reservation|
      @bicycle = reservation.bicycle
      @user = reservation.user
    end

  end

  def show
    @reservation = Reservation.find(params[:id])
    @user = @reservation.user
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new( reservation_params )
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservations_path, notice: 'Reservation was successfully created'
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:from_date, :to_date)
  end
end
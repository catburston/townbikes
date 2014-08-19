class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @reservations.each do |reservation|
      @bicycle = Bicycle.find(reservation.bicycle_id)
      @owner = User.find(@bicycle.user_id)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @bicycle = Bicycle.find(@reservation.bicycle_id)
    @owner = User.find(@bicycle.user_id)
  end

  def new
    @user = current_user
    @bicycle = Bicycle.find(params[:bicycle_id])
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @bicycle = Bicycle.find(params[:bicycle_id])
    @reservation = Reservation.new( reservation_params )
    if @reservation.save
      redirect_to action: :index, controller: :reservations, user_id: @user.id, bicycle_id: @bicycle.id, notice: 'Reservation was successfully created'
    else
      @errors = @visit.errors.full_messages
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:from_date, :to_date)
  end
end

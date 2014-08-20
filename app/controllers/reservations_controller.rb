class ReservationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @reservations = Reservation.all
    @reservations.each do |reservation|
      @bicycle = reservation.bicycle
      @owner = reservation.user
      # @location = reservation.location
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @bicycle = Bicycle.find(@reservation.bicycle_id)
    @owner = User.find_by(:id => @bicycle.user_id)
    @location = Location.find_by(:user_id => @owner.id)
  end

  def new
    @user = current_user
    @bicycle = Bicycle.find(reservation_params[:bicycle_id])
    @bicycle.reservations.build
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @bicycle = Bicycle.find(reservation_params[:bicycle_id])
    @reservation = Reservation.new( reservation_params )
    if @reservation.save
      redirect_to action: :index, controller: :reservations, notice: 'Reservation was successfully created'
    else
      @errors = @visit.errors.full_messages
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :bicycle_id, :from_date, :to_date)
  end
end

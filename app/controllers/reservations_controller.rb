class ReservationsController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @user = current_user
    if params[:status].present?
      @user_reservations = Reservation.where(:user_id => current_user.id)
      @user_reservations = @user_reservations.select { |reservation| reservation.status == params[:status] }
    elsif params[:bicycle_id].present?
      # @user_reservations2 = Reservation.all.select { |reservation| reservation.bicycle_id == params[:bicycle_id] }
      @user_reservations = Reservation.where(bicycle_id: params[:bicycle_id])
    else
      @user_reservations = Reservation.where(:user_id => current_user.id)
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

  def edit
    @user = current_user
    @bicycle = Bicycle.where(id: params[:bicycle_id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @user = current_user
    @bicycle = Bicycle.where(id: params[:bicycle_id])
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes( reservation_params )
      redirect_to reservation_path(@reservation.id, :bicycle_id => @reservation.bicycle.id), notice: 'Reservation was successfully updated'
    else
        # @errors = @reservation.errors.full_messages
        render :edit, :bicycle_id => @reservation.bicycle.id
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :bicycle_id, :from_date, :to_date, :status )
  end
  def reservation_update_params
    params.require(:reservation).permit(:status)
  end
end

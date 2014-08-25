class ReservationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:bicycle] == "renter"
      if params[:status].present?
        @user_reservations = Reservation.where(:user_id => current_user.id)
        @user_reservations = @user_reservations.select { |reservation| reservation.status == params[:status] }
      elsif params[:expired].present?
        @user_reservations = Reservation.where(:user_id => current_user.id)
        @user_reservations = @user_reservations.select { |reservation| reservation.to_date <= Date.today }
      else
        @user_reservations = Reservation.where(:user_id => current_user.id)
      end
    elsif params[:bicycle] == "owner"
      if params[:status].present?
        @user_reservations = Reservation.where(:bicycle_id => current_user.bicycles.ids)
        @user_reservations = @user_reservations.select { |reservation| reservation.status == params[:status] }
      elsif params[:expired].present?
        @user_reservations = Reservation.where(:bicycle_id => current_user.bicycles.ids)
        @user_reservations = @user_reservations.select { |reservation| reservation.to_date <= Date.today }
      else
        @user_reservations = Reservation.where(:bicycle_id => current_user.bicycles.ids)
      end
    elsif params[:bicycle_id].present?
      @user_reservations = Reservation.where(bicycle_id: params[:bicycle_id])
    else
      @user_reservations = Reservation.where(:user_id => current_user.id)
      # @user_reservations+= Reservation.where(:bicycle_id => current_user.bicycles.ids)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @bicycle = Bicycle.find(reservation_params[:bicycle_id])
    @bicycle.reservations.build
    @reservation = Reservation.new
  end

  def create
    @bicycle = Bicycle.find(reservation_params[:bicycle_id])
    @reservation = Reservation.new( reservation_params )
    if @bicycle.user != current_user && @reservation.save
      NewReservationMailer.new_reservation_mail(@reservation.owner, @reservation).deliver
      redirect_to reservation_path(@reservation.id), notice: 'Reservation was sent to the bicycle owner for approval'
    else
      render :new, :bicycle_id => @bicycle.id, notice: "The dates selected are not available"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    if current_user != @reservation.owner
      redirect_to reservation_path(@reservation.id), notice:"You cannot edit this reservation."
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.from_date.to_date < Date.today.to_date
      redirect_to reservations_path, notice: "This reservation begins today and cannot be updated"
    elsif @reservation.update_attributes( reservation_params )
      StatusChangeMailer.status_change_mail(@reservation.renter, @reservation).deliver
      redirect_to reservation_path(@reservation.id, :bicycle_id => @reservation.bicycle.id), notice: 'Reservation status was successfully updated. The renter will receive a notification.'
    else
      render :edit, :bicycle_id => @reservation.bicycle.id, notice: "This reservation cannot be updated"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :bicycle_id, :from_date, :to_date, :status )
  end
end

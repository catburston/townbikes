class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  # def show
  #   @user = User.find(params[:id])
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   token = SecureRandom.urlsafe_base64(24)
  #   @user = User.new(user_params.merge(confirmation_token:token))

  #   if @user.save
  #     set_session(@user)
  #     UserMailer.signup_confirmation(@user).deliver
  #     redirect_to new_bicycles_path, notice: 'User account created'
  #   else
  #     render :new
  #   end
  # end

  # def confirm
  #   user = User.find_by_confirmation_token(params[:confirmation_token])

  #   if user
  #     user.confirm!
  #     set_session(user)    # we log the user in without asking for his password
  #     redirect_to bicycles_path, notice: 'You confirmed your email!'
  #   else
  #     redirect_to new_session_path, notice: 'Token not valid'
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :location, :password, :password_confirmation, :location, :email_address, :description, :phone_number, :avatar, :properties)
  # end
end
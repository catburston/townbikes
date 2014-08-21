class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bicycles = @user.bicycles
    @location = Location.find_by(:user_id => @user.id)
  end
end

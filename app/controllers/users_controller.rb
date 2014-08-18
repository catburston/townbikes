class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bicycles = @user.bicycles
  end
end
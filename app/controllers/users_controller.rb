class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bicycles = @user.bicycles      # Why do I need this? Otherwise @user.bicycles in the show doesn't work
  end
end

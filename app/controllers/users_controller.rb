class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      render "show" 
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    @quotes = @user.quotes
  end

  private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end

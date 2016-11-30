class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      
      redirect_to root_path
      flash[:notice] = "Welcome to Reddit on Rails"
    else
      redirect_to :back
      flash[:notice] = "User could not be saved"
    end

  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirm)
    end
end

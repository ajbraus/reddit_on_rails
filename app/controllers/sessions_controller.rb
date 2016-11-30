class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])
    if @user.present?
      session[:id] = @user.id
      flash[:notice] = "Successfully logged in"
      redirect_to root_path
    else
      flash[:notice] = "Your credentials were not found or were not correct"
      redirect_to :back
    end
  end

  def destroy
    session[:id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirm)
    end
end

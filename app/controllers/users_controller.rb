class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # Allows the user to fill out the form and save it
    # Calls the setter for the user params that it takes in
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up successfully"
      session[:remember_token] = @user.id.to_s
      redirect_to events_path
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin?)
  end
end
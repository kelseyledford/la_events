class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(:email => params[:session][:email]).first

    if @user == nil || !@user.authenticate(params[:session][:password])
      flash[:error] = "Invalid email/password combination"
      render 'new'
    else
      session[:remember_token] = @user.id.to_s
      # Is there a less hacky way to get rid of the flash?
      flash[:none] = ""
      @current_user = @user
      redirect_to events_path
    end

  end

  def destroy
    session.delete(:remember_token)
    redirect_to root_path
  end

end
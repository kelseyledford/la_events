# This controller creates and deletes sessions
class SessionsController < ApplicationController
  def new
  end

  def create
    # Email param contains everything that the user typed in on the form
    # Uses .where to look up all of the user whose email matches the email that was typed in on the form
    @user = User.where(:email => params[:session][:email]).first
    # No user in the db that matches that email or password doesn't match the one in the db
    if @user == nil || !@user.authenticate(params[:session][:password])
      # flash.now
      flash[:error] = "Invalid email/password combination"
      render 'new'
    # If there was already a user in the db that had an email matching the one that 
    # was passed in, and if the password is correct (returns true), a new session is set up
    else
      # Sets the remember_token on the attr to user id
      # Whenever the user logs in it checks to see if there's a session remember token and check the user id that's stored in it
      session[:remember_token] = @user.id.to_s
      # Gets rid of the flash
      flash[:none] = ""
      @current_user = @user
      redirect_to events_path
    end

  end

  def destroy
    # Doesn't delete the user model, but deletes the fact that they are logged in
    session.delete(:remember_token)
    redirect_to root_path
  end

end
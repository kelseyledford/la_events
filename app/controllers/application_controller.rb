class ApplicationController < ActionController::Base
  # Prevent CSRF (cross-site request forgery) attacks by raising an exception.
  protect_from_forgery with: :exception
  include ApplicationHelper

  #If you aren't signed in, you're redirected to the login form
  # def authenticate_user
  #   if !self.current_user
  #     render "shared/home"
  #   end
  # end

  # Sets the timezone to Pacific Time before anything is created/saved/updated
	# This will then be translated into UTC in Mongo before being changed back to Pacific in the view
 	def set_timezone
  	Time.zone = "Pacific Time (US & Canada)"
 	end

end

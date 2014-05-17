class EventsController < ApplicationController

	before_action :authenticate_user
	before_filter :set_timezone

 	def set_timezone
  	Time.zone = "Pacific Time (US & Canada)"
 	end

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def nav
		@show_nav = true
	end

end

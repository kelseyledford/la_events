class EventsController < ApplicationController

	before_action :authenticate_user
	before_filter :set_timezone

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

end

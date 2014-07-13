class EventsController < ApplicationController

	# before_action :authenticate_user
	before_filter :set_timezone

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
 		event_date = params[:event]
 		# Sets one new date using the three different types of input from the form (d, m, y)
		@event.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
		start_time = params[:event]
		# Sets one new time from the two different types of input from the form (h, m)
		# Sets one m, d, y for all new times so that when they are pulled from the db and display as just the time in the view (e.g. 7:00pm), they are sort by time rather than by date (which is listed before the time in the db)
		@event.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
		end_time = params[:event]
		@event.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
		# Stores the user who created the event so that it can be displayed in the view
		if @current_user
			@event.created_by_id = @current_user.name
		end
		if @event.save
			flash[:success] = "Event created"
			redirect_to events_path
		else
			render action: 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
	end

		def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		event_date = params[:event]
		start_time = params[:event]
		end_time = params[:event]
		if @event.update_attributes (event_params)
			# Stores the user who last updated the event so that it can be displayed in the view
			@event.updated_by_id = @current_user.name
			@event.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
			@event.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
			@event.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
			@event.save
			flash[:success] = "Event updated"
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Event deleted"
    redirect_to events_path
  end

  def festival
		@festivals = Event.where(event_type_id:("53bde56b6b656c30ba0a0000")).all
  end

  def con
  	@cons = Event.where(event_type_id:("53bde56b6b656c30ba0d0000")).all
  end

  def concert
  	@concerts = Event.where(event_type_id:("53bde56b6b656c30ba0c0000")).all
  end

  def art
  	@arts = Event.where(event_type_id:("53bde56b6b656c30ba0b0000")).all
  end

  protected

  def event_params
  	params.require(:event).permit(:image, :name, :price, :event_type, :neighborhood, :details, :street, :city, :state, :zip, :coordinates, :updated_by_id, :created_by_id)
  end

end

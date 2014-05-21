class ArtEventsController < EventsController

	# Connected to the authenticate_user function in the application controller
	# Prevents people from touching this controller until they are logged in
	before_action :authenticate_user
	before_filter :set_timezone

	# Sets the timezone to Pacific Time before anything is created/saved/updated
	# This will then be translated into UTC in Mongo before being changed back to Pacific in the view
 	def set_timezone
  	Time.zone = "Pacific Time (US & Canada)"
 	end

	def index
		@artevents = ArtEvent.all
	end

	def new
		@artevent = ArtEvent.new
	end

	def create
		@artevent = ArtEvent.new(event_params)
 		event_date = params[:art_event]
 		# Sets one new date using the three different types of input from the form (d, m, y)
		@artevent.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
		start_time = params[:art_event]
		# Sets one new time from the two different types of input from the form (h, m)
		# Sets one m, d, y for all new times so that when they are pulled from the db and display as just the time in the view (e.g. 7:00pm), they are sort by time rather than by date (which is listed before the time in the db)
		@artevent.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
		end_time = params[:art_event]
		@artevent.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
		# Stores the user who created the event so that it can be displayed in the view
		@artevent.created_by_id = @current_user.name
		if @artevent.save
			flash[:success] = "Event created"
			redirect_to art_events_path
		else
			render action: 'new'
		end
	end

	def show
		@artevent = ArtEvent.find(params[:id])
		
	end

	def edit
		@artevent = ArtEvent.find(params[:id])
	end

	def update
		@artevent = ArtEvent.find(params[:id])
		event_date = params[:art_event]
		start_time = params[:art_event]
		end_time = params[:art_event]
		if @artevent.update_attributes (event_params)
			# Stores the user who last updated the event so that it can be displayed in the view
			@artevent.updated_by_id = @current_user.name
			@artevent.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
			@artevent.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
			@artevent.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
			@artevent.save
			flash[:success] = "Event updated"
			redirect_to @artevent
		else
			render 'edit'
		end
	end

	def destroy
    @artevent = ArtEvent.find(params[:id])
    @artevent.destroy
    flash[:success] = "Event deleted"
    redirect_to artevents_path
  end

  protected

  def event_params
  	params.require(:art_event).permit(:image, :name, :price, :neighborhood, :details, :street, :city, :state, :zip, :coordinates, :updated_by_id, :created_by_id)
  end

end

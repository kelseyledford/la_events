class ArtEventsController < EventsController

	before_action :authenticate_user
	before_filter :set_timezone

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
		@artevent = ArtEvent.new(params.require(:art_event).permit(:name, :price, :neighborhood, :details, :street, :city, :state, :zip, :coordinates, :updated_by_id, :created_by_id))
 		event_date = params[:art_event]
		@artevent.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
		start_time = params[:art_event]
		@artevent.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
		end_time = params[:art_event]
		@artevent.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
		if @artevent.save
			@artevent.update_attributes(:created_by_id => current_user.id)
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
		if @artevent.update_attributes (params.require(:art_event).permit(:name, :price, :neighborhood, :details, :street, :city, :state, :zip, :coordinates, :updated_by_id, :created_by_id))
			@artevent.update_attributes(:updated_by_id => current_user.id)
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

end

class ConsController < EventsController

	before_action :authenticate_user
	before_filter :set_timezone

 	def set_timezone
  	Time.zone = "Pacific Time (US & Canada)"
 	end

	def index
		@cons = Con.all
	end

	def new
		@con = Con.new
	end

	def create
		@con = Con.new(params.require(:con).permit(:name, :price, :details, :street, :city, :state, :zip, :coordinates, :updated_by_id, :created_by_id))
 		event_date = params[:con]
		@con.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
		start_time = params[:con]
		@con.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
		end_time = params[:con]
		@con.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
		if @con.save
			@con.update_attributes(:created_by_id => current_user.id)
			flash[:success] = "Event created"
			redirect_to cons_path
		else
			render action: 'new'
		end
	end

	def show
		@con = Con.find(params[:id])
		
	end

	def edit
		@con = Con.find(params[:id])
	end

	def update
		@con = Con.find(params[:id])
		event_date = params[:con]
		start_time = params[:con]
		end_time = params[:con]
		if @con.update_attributes (params.require(:con).permit(:name, :price, :neighborhood, :details, :street, :city, :state, :zip, :coordinates, :updated_by_id, :created_by_id))
			@con.update_attributes(:updated_by_id => current_user.id)
			@con.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
			@con.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
			@con.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
			@con.save
			flash[:success] = "Event updated"
			redirect_to @con
		else
			render 'edit'
		end
	end

	def destroy
    @con = Con.find(params[:id])
    @con.destroy
    flash[:success] = "Event deleted"
    redirect_to cons_path
  end

end

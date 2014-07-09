class ConcertsController < EventsController

	before_action :authenticate_user
	before_filter :set_timezone

	def index
		@concerts = Concert.all
	end

	def new
		@concert = Concert.new
	end

	def create
		@concert = Concert.new(event_params)
 		event_date = params[:concert]
		@concert.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
		start_time = params[:concert]
		@concert.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
		end_time = params[:concert]
		@concert.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
		if @concert.save
			@concert.created_by_id = @current_user.name
			flash[:success] = "Event created"
			redirect_to concerts_path
		else
			render action: 'new'
		end
	end

	def show
		@concert = Concert.find(params[:id])
		
	end

	def edit
		@concert = Concert.find(params[:id])
	end

	def update
		@concert = Concert.find(params[:id])
		event_date = params[:concert]
		start_time = params[:concert]
		end_time = params[:concert]
		if @concert.update_attributes (event_params)
			@concert.updated_by_id = @current_user.name
			@concert.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
			@concert.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
			@concert.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
			@concert.save
			flash[:success] = "Event updated"
			redirect_to @concert
		else
			render 'edit'
		end
	end

	def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    flash[:success] = "Event deleted"
    redirect_to concerts_path
  end

  protected

  def event_params
  	params.require(:concert).permit(:image, :name, :price, :neighborhood, :details, :street, :city, :state, :zip, :coordinates, :updated_by_id, :created_by_id)
  end

end

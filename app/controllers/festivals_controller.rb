class FestivalsController < EventsController

	# before_action :authenticate_user
	before_filter :set_timezone

	def index
		@festivals = Festival.all
	end

	def new
		@festival = Festival.new
	end

	def create
		@festival = Festival.new(event_params)
 		event_date = params[:festival]
		start_time = params[:festival]
		end_time = params[:festival]
		@festival.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
		@festival.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
		@festival.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
		@festival.created_by_id = @current_user.name
		if @festival.save
			flash[:success] = "Event created"
			redirect_to festivals_path
		else
			render action: 'new'
		end
	end

	def show
		@festival = Festival.find(params[:id])
		
	end

	def edit
		@festival = Festival.find(params[:id])
	end

	def update
		@festival = Festival.find(params[:id])
		event_date = params[:festival]
		start_time = params[:festival]
		end_time = params[:festival]
		if @festival.update_attributes (event_params)
			@festival.updated_by_id = @current_user.name
			@festival.event_date = Date.new event_date["event_date(1i)"].to_i, event_date["event_date(2i)"].to_i, event_date["event_date(3i)"].to_i
			@festival.start_time = Time.new 1900, 1, 1, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
			@festival.end_time = Time.new 1900, 1, 1, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
			@festival.save
			flash[:success] = "Event updated"
			redirect_to @festival
		else
			render 'edit'
		end
	end

	def destroy
    @festival = Festival.find(params[:id])
    @festival.destroy
    flash[:success] = "Event deleted"
    redirect_to festivals_path
  end

  private

  def event_params
  	params.require(:festival).permit(:image, :name, :price, :neighborhood, :details, :street, :city, :state, :zip, :coordinates, :updated_by_id, :created_by_id)
  end

end

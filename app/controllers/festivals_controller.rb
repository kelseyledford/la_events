class FestivalsController < ApplicationController
	def index
		@festivals = Festival.all
	end

	def new
		@festival = Festival.new
	end

	def create
		@festival = Festival.new(params.require(:festival).permit(:name, :type, :neighborhood, :address, :details))
 		fest_date = params[:festival]
		@festival.fest_date = Date.new fest_date["fest_date(1i)"].to_i, fest_date["fest_date(2i)"].to_i, fest_date["fest_date(3i)"].to_i
		start_time = params[:festival]
		@festival.start_time = Time.new start_time["start_time(1i)"].to_i, start_time["start_time(2i)"].to_i, start_time["start_time(3i)"].to_i, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
		end_time = params[:festival]
		@festival.end_time = Time.new end_time["end_time(1i)"].to_i, end_time["end_time(2i)"].to_i, end_time["end_time(3i)"].to_i, end_time["end_time(4i)"].to_i, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
		if @festival.save
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
		fest_date = params[:festival]
		start_time = params[:festival]
		end_time = params[:festival]
		if @festival.update_attributes(params.require(:festival).permit(:name, :type, :neighborhood, :address, :details))
			@festival.fest_date = Date.new fest_date["fest_date(1i)"].to_i, fest_date["fest_date(2i)"].to_i, fest_date["fest_date(3i)"].to_i
			@festival.start_time = Time.new start_time["start_time(1i)"].to_i, start_time["start_time(2i)"].to_i, start_time["start_time(3i)"].to_i, start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i
			@festival.end_time = Time.new end_time["end_time(1i)"].to_i, end_time["end_time(2i)"].to_i, end_time["end_time(3i)"].to_i, end_time["end_time(4i)"].to_i, end_time["end_time(5i)"].to_i
			@festival.save
			redirect_to festivals_path
		else
			render 'edit'
		end
	end

end
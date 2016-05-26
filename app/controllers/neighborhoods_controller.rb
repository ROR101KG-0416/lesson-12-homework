class NeighborhoodsController < ApplicationController
	before_action :find_neighborhood, only: [:show, :edit, :update, :destroy]

	def index
		@neighborhoods = Neighborhood.all
	end

	def show
	end

	def new
		@neighborhood = Neighborhood.new
	end

	def create
		@neighborhood = Neighborhood.new(neighborhood_params)

		if @neighborhood.save
			flash[:notice] = "Neighborhood created successfully."
			redirect_to neighborhoods_path
		else
			flash.now[:error] = "There was an error creating this neighborhood."
			render :new
		end
	end

	def edit
	end

	def update
		if @neighborhood.update(neighborhood_params)
			flash[:notice] = "Neighborhood updated successfully."
			redirect_to neighborhood_path(@neighborhood)
		else
			flash.now[:error] = "There was an error updating this neighborhood."
			render :edit
		end
	end

	def destroy
		@neighborhood.delete
		redirect_to neighborhoods_path
	end


	private

	def find_neighborhood
		@neighborhood = Neighborhood.find_by_id(params[:id])
	end

	def neighborhood_params
		params.require(:neighborhood).permit(:name)
	end
end

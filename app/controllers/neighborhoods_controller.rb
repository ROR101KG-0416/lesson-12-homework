class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all
  end

  def show
    @neighborhood = Neighborhood.find_by_id(params[:id])
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.new(neighborhood_params)

    if @neighborhood.save
      flash[:notice] = "Neighborhood saved successfully"
      redirect_to neighborhoods_path
    else
      flash.now[:error] = "There was a problem saving this Neighborhood"
      render :new
    end
  end

  def edit
    @neighborhood = Neighborhood.find_by_id(params[:id])
  end

  def update 
    @neighborhood = Neighborhood.find_by_id(params[:id])

    if @neighborhood.update(neighborhood_params)
      redirect_to neighborhood_path(@neighborhood), notice: "Neighborhood was updated successfully"
    else
      flash.now[:error] = "There was an issue updating this Neighborhood"
      render :edit
    end
  end

  def destroy
    @neighborhood = Neighborhood.find_by_id(params[:id])

    @neighborhood.delete

    redirect_to neighborhoods_path
  end

  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name)
  end

end
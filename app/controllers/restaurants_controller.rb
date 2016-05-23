class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end
  
  def create
    @restaurant = Restaurant.create(restaurant_params)
    
    if @restaurant.save
      flash[:notice] = "Restaurant saved."
      redirect_to restaurants_path
    else
      flash.now[:error] = "There's an issue saving."
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant), notice: "Restaurant saved"
    else
      flash.new[:error] = "There's an issue saving"
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :street, :city, :state, :country, :postal_code, :neighborhood_id, :category_ids => [])
  end
end
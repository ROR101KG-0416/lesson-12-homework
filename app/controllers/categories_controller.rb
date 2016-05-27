class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :edit]
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category saved successfully"
      redirect_to categories_path
    else
      flash.now[:error] = "There was a problem saving this Category"
      render :new
    end
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def update 
    @category = Category.find_by_id(params[:id])

    if @category.update(category_params)
      redirect_to category_path(@category), notice: "Category was updated successfully"
    else
      flash.now[:error] = "There was an issue updating this Category"
      render :edit
    end
  end

  def destroy
    @category = Category.find_by_id(params[:id])

    @category.delete

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
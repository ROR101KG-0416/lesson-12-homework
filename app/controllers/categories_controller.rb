class CategoriesController < ApplicationController
	before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
	before_action :find_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all
	end

	def show
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "Category was saved successfully"
			redirect_to categories_path
		else
			flash.now[:error] = "There was an error saving this category"
			render :new
		end
	end

	def edit
	end

	def update
		if @category.update(category_params)
			redirect_to category_path(@category), notice: "Category was updated successfully"
		else
			flash.now[:error] = "There was an error updating this category."
			render :edit
		end
	end

	def destroy
		@category.delete
		redirect_to categories_path
	end
	

	private

	def find_category
		@category = Category.find_by_id(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end

end
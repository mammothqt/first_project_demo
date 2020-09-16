class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	# before_action :is_admin?, only: [:create, :edit, :update, :destroy]

	def index
		@categories = Category.all
	end

	def show; end

	def new
		@category = Category.new
	end

	def create
		@category = Category.create category_params

		if @category.save
			flash[:success] = "Category created!"
			redirect_to category_courses_path @category
		else
			render new_category_path
		end
	end

	def update
		if @category.update!(category_params)
			flash[:success] = "Category has been updated"
			redirect_to category_courses_path @category
		else
			render edit_category_path @category
		end
	end

	def destroy
		flash[:success] = "Category has been deleted" if @category.destroy!
		redirect_to categories_path
	end

	private
	def set_category
		@category = Category.find params[:id]
	end

	def category_params
		params.require(:category).permit(:name, :description)
	end
end

class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_params

    if @category.save
      flash[:success] = "Category created!"
	    redirect_to category_courses_path @category
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all.paginate page: params[:page], per_page: 10
  end

  def update
    if @category.update category_params
	    flash[:success] = "Category has been updated"
	    redirect_to category_courses_path @category
	  else
	    render 'edit'
    end
  end

  def destroy
    flash[:success] = "Category has been deleted" if @category.destroy
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find params[:id]
    redirect_to root_path if @category.nil?
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end


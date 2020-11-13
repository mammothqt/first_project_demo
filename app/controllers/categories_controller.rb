class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :load_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = t('.category_create')
	    redirect_to category_courses_path(@category)
    else
      render :new
    end
  end

  def index
    @categories = Category.newest.paginate(page: params[:page],
      per_page: Settings.item.default_number)
  end

  def update
    if @category.update(category_params)
	    flash[:success] = t('.category_update')
	    redirect_to category_courses_path(@category)
	  else
	    render :edit
    end
  end

  def destroy
    flash[:success] = t('.category_delete') if @category.destroy
    redirect_to categories_path
  end

  private

  def load_category
    @category = Category.find_by(id: params[:id])
    redirect_to root_path if @category.blank?
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end

class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_category
  before_action :load_course, only: [:edit, :update, :destroy, :show]

  def new
    @course = Course.new
  end

  def index
    @courses = @category.courses.newest.paginate(page: params[:page],
                                                 per_page: Settings.item.default_number)
  end

  def show; end

  def create
    @course = @category.courses.new(course_params)

    if @course.save
      flash[:success] = t('.course_create')
      redirect_to category_course_path(@category, @course)
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      flash[:success] = t('.course_update')
      redirect_to category_course_path(@category, @course)
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = t('.course_delete') if @course.destroy
    redirect_to category_courses_path(@category)
  end

  private

  def load_category
    @category = Category.find_by(id: params[:category_id])
    redirect_to root_path if @category.blank?
  end

  def load_course
    @course = @category.courses.find_by(id: params[:id])
    redirect_to root_path if @course.blank?
  end

  def course_params
    params.require(:course).permit(:name, :description, :category_id)
  end
end

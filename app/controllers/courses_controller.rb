class CoursesController < ApplicationController
	before_action :set_category, only: [:new, :index, :update, :destroy, :create, :edit]
	before_action :set_course, only: [:edit, :update, :destroy]

	def new
		@course = Course.new
	end

	def index
		@courses = @category.courses.all
	end

	def show
		if params[:category_id]
			set_category
			set_course
		else
			@course = Course.find_by_id params[:id]
			@category = @course.category
		end
	end

	def create
		@course = @category.courses.create course_params

		if @course.save
			flash[:success] = "Course has been created!"
			redirect_to category_course_path(@category, @course)
		else
			render new_category_course_path(@category)
		end
	end

	def update
		if @course.update(course_params)
			flash[:success] = "Course has been updated"
			redirect_to category_course_path(@category, @course)
		else
			render edit_category_course_path(@category, @course)
		end
	end

	def destroy
		flash[:success] = "Course has been deleted" if @course.destroy!
		redirect_to category_courses_path(@category)
	end

	private
	def set_category
		@category = Category.find_by_id params[:category_id]
		# redirect_to root_path if @category.nil?
	end

	def set_course
		@course = @category.courses.find_by_id params[:id]
		# redirect_to root_path if @course.nil?
	end

	def course_params
		params.require(:course).permit(:name, :description, :category_id)
	end
end

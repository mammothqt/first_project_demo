class WordListsController < ApplicationController
  before_action :set_course
  before_action :set_word_list, only: [:show, :edit, :update, :destroy]

  def new
    @word_list = WordList.new
  end

  def index
	@word_list = @course.word_lists.all
  end

  def show; end

  def create
	@word_list = @course.word_lists.create word_list_params

	if @word_list.save
	  flash[:success] = "Word has been created!"
	  redirect_to course_path @course
	else
	  render new_course_word_list_path(@course)
	end
  end

  def update
    if @word_list.update(word_list_params)
	  flash[:success] = "Word has been updated"
	  redirect_to course_path @course
	else
	  render edit_course_word_list_path(@course, @word_list)
	end
  end

  def destroy
	flash[:success] = "Word has been deleted" if @word_list.destroy
	redirect_to course_path(@course)
  end

  private
  def set_course
	@course = Course.find_by_id params[:course_id]
	# redirect_to root_path if @category.nil?
  end

  def set_word_list
	@word_list = @course.word_lists.find_by_id params[:id]
	# redirect_to root_path if @course.nil?
  end

  def word_list_params
	params.require(:word_list).permit(:word, :course_id)
  end
end

class WordListsController < ApplicationController
  load_and_authorize_resource
  before_action :load_course
  before_action :load_word_list, only: [:edit, :update, :destroy]

  def new
    @word_list = WordList.new
  end

  def index
    @word_list = @course.word_lists.newest
  end

  def create
    @word_list = @course.word_lists.new(word_list_params)

    if @word_list.save
      flash[:success] = t('.word_create')
      redirect_to category_course_path(@course.category, @course)
    else
      render :new
    end
  end

  def update
    if @word_list.update(word_list_params)
      flash[:success] = t('.word_update')
      redirect_to category_course_path(@course.category, @course)
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = t('.word_delete') if @word_list.destroy
    redirect_to category_course_path(@course.category, @course)
  end

  private

  def load_course
	  @course = Course.find_by(id: params[:course_id])
	  redirect_to root_path if @course.blank?
  end

  def load_word_list
    @word_list = @course.word_lists.find_by(id: params[:id])
    redirect_to root_path if @word_list.blank?
  end

  def word_list_params
    params.require(:word_list).permit(:word, :course_id)
  end
end

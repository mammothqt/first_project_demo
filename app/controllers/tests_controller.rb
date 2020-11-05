class TestsController < ApplicationController
  load_and_authorize_resource
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def new
    @test = Test.new
    1.times {
	  @question = @test.questions.build
      4.times { @answer = @question.answers.build }
    }
  end

  def index
    @tests = Test.all.paginate page: params[:page], per_page: 10
  end

  def show; end

  def create
    @test = Test.create test_params

    if @test.save
      flash[:success] = "Test created!"
      redirect_to test_path @test
    else
	    render "new"
    end
  end

  def edit; end

  def update
    if @test.update test_params
      flash[:success] = "Test has been update!"
      render "show"
    else
      render "edit"
    end
  end

  def destroy
    flash[:success] = "Test has been deleted!" if @test.destroy
    redirect_to tests_path
  end

  private
  def test_params
    params.require(:test).permit(:id, :name, :description,
      questions_attributes: [:id, :content, :correct_answer_id, answers_attributes: [:id, :content]])
  end

  def set_test
    @test = Test.find_by_id params[:id]
    redirect_to root_path if @test.nil?
  end
end

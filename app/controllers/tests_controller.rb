class TestsController < ApplicationController
  load_and_authorize_resource
  before_action :load_test, only: [:show, :edit, :update, :destroy]

  def new
    @test = Test.new
    Settings.test.number_question.times {
	    @question = @test.questions.build
      Settings.question.number_answer.times {
        @answer = @question.answers.build
      }
    }
  end

  def index
    @tests = Test.newest.paginate(page: params[:page], per_page: Settings.item.default_number)
  end

  def show; end

  def create
    @test = Test.new(test_params)

    if @test.save
      flash[:success] = t('.test_create')
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      flash[:success] = t('.test_update')
      render :show
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = t('.test_delete') if @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:id, :name, :description,
                                 questions_attributes: [:id, :content, :correct_answer_id,
                                 answers_attributes: [:id, :content]])
  end

  def load_test
    @test = Test.find_by(id: params[:id])
    redirect_to root_path if @test.blank?
  end
end

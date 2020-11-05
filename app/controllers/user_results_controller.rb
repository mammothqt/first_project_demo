class UserResultsController < ApplicationController
  before_action :set_user_result, only: [:show, :destroy]
  before_action :set_test
  before_action :set_user
  after_action :is_correct_answer, only: [:create]

  def new
	  @user_result = UserResult.new
	  @user_answer = @user_result.user_answers.build
  end

  def create
    @user_result = @user.user_results.create user_result_params

    if @user_result.save
      flash[:success] = "You have done your test. This is your result"
      redirect_to user_test_user_results_path
    else
      redirect_to new_user_test_user_result_path @user, @test
    end
  end

  def index
  	@user_results = @user.user_results.includes(:test)
  end

  def show; end

  private
  def set_user_result
	  @user_result = UserResult.find_by_id params[:id]
  end

  def set_test
	  @test = Test.find_by_id params[:test_id]
  end

  def set_user
  	@user = User.find_by_id params[:user_id]
  end

  def user_result_params
	  params.require(:user_result).permit(:id, :test_id,
	    user_answers_attributes: [:id, :user_result_id, :user_answer, :question_id])
  end

  def is_correct_answer
    @user_result.user_answers.each do |u|
      u.update_is_correct u.decorate.user_answer_correct?
    end
  end
end

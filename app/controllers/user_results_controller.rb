class UserResultsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user_result, only: [:show, :destroy]
  before_action :set_test, only: [:new, :create]
  before_action :set_user

  def new
	  @user_result = UserResult.new
	  @user_answer = @user_result.user_answers.build
  end

  def create
    @user_result = @user.user_results.create user_result_params

    if @user_result.save
      is_correct_answer
      flash[:success] = "You have done your test. This is your result"
      redirect_to user_user_result_path @user, @user_result
    else
      redirect_to new_user_test_user_result_path @user, @test
    end
  end

  def index
  	@user_results = @user.user_results.includes(:test).paginate page: params[:page], per_page: 10
  end

  def show; end

  private
  def set_user_result
	  @user_result = UserResult.find_by_id params[:id]
    redirect_to root_path if @user_result.nil?
  end

  def set_test
	  @test = Test.find_by_id params[:test_id]
    redirect_to root_path if @test.nil?
  end

  def set_user
  	@user = User.find_by_id params[:user_id]
    redirect_to root_path if @user.nil?
  end

  def user_result_params
	  params.require(:user_result).permit(:id, user_answers_attributes:
      [:id, :user_result_id, :user_answer, :question_id]).merge(test_id: params[:test_id])
  end

  def is_correct_answer
    @user_result.user_answers.each do |u|
      u.update_is_correct u.decorate.user_answer_correct?
    end
    compute_result
  end

  def compute_result
    @user_result.update grade: @user_result.number_correct_answer
    @user_result.update status: @user_result.grade < 8 ? 0 : 1
  end
end

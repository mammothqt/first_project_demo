class UserResultsController < ApplicationController
  load_and_authorize_resource
  before_action :load_user_result, only: [:show, :destroy]
  before_action :load_test, only: [:new, :create]
  before_action :load_user

  def new
	  @user_result = UserResult.new
	  @user_answer = @user_result.user_answers.build
  end

  def create
    @user_result = @user.user_results.new(user_result_params)

    if @user_result.save
      ComputeGradeService.new(@user_result).perform
      flash[:success] = t(".congratulation")
      redirect_to user_user_result_path @user, @user_result
    else
      flash[:error] = t(".warning")
      redirect_to new_user_test_user_result_path @user, @test
    end
  end

  def index
  	@user_results = @user.user_results.includes(:test).newest
      .paginate(page: params[:page], per_page: Settings.user_result.default_number)
  end

  def show; end

  private

  def load_user_result
	  @user_result = UserResult.find_by(id: params[:id])
    redirect_to root_path if @user_result.blank?
  end

  def load_test
	  @test = Test.find_by(id: params[:test_id])
    redirect_to root_path if @test.blank?
  end

  def load_user
  	@user = User.find_by(id: params[:user_id])
    redirect_to root_path if @user.blank?
  end

  def user_result_params
	  params.require(:user_result).permit(:id, user_answers_attributes:
      [:id, :user_result_id, :user_answer]).merge(test_id: params[:test_id])
  end
end

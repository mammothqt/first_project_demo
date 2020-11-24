class UserResultsController < ApplicationController
  load_and_authorize_resource
  before_action :load_user, except: [:new, :create]
  before_action :load_test, only: [:new, :create]
  before_action :load_user_result, only: :show

  def new
    @user_result = UserResult.new
    @test.questions.size.times { @user_answer = @user_result.user_answers.build }
  end

  def create
    @user_result = current_user.user_results.new(user_result_params)

    ActiveRecord::Base.transaction do
      @user_result.save!
      ComputeGradeService.new(@user_result).perform
      flash[:success] = t('.congratulation')
      redirect_to user_user_result_path(current_user, @user_result)
    end
  rescue ActiveRecord::RecordInvalid => exception
    flash[:error] = t('.warning')
    render :new
  end

  def index
    @user_results = @user.user_results.includes(:test).newest
                         .paginate(page: params[:page], per_page: Settings.user_result.default_number)
  end

  def show; end

  private

  def load_test
    @test = Test.find_by(id: params[:test_id])
    redirect_to root_path if @test.blank?
  end

  def load_user
    @user = User.find_by(id: params[:user_id])
    redirect_to root_path if @user.blank?
  end

  def load_user_result
    @user_result = @user.user_results.find_by(id: params[:id])
    redirect_to root_path if @user_result.blank?
  end

  def user_result_params
    params.require(:user_result).permit(:id, user_answers_attributes: [:id, :answer_id])
                                .merge(test_id: params[:test_id])
  end
end

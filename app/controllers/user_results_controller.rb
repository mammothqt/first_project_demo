class UserResultsController < ApplicationController
	before_action :set_test, only: :new
	before_action :set_user_result, only: :show

	def new
		@user_result = UserResult.new
		@user_answer = @user_result.user_answers.build
	end

	def create
		@user_result = UserResult.create user_result_params

		if @user_result.save
			flash[:success] = "You have done your test. This is your result"
			redirect_to user_result_path @user_result
		else
			set_test
			redirect_to new_user_result_path(:test_id => @test.id)
		end
	end

	def show; end

	private
	def set_user_result
		@user_result = UserResult.find_by_id params[:id]
	end

	def set_test
		@test = Test.find_by_id params[:test_id] || user_result_params[:test_id]
	end

	def user_result_params
		params.require(:user_result).permit(:id, :test_id, :user_id,
			user_answers_attributes: [:id, :user_result_id, :user_answer])
	end
end

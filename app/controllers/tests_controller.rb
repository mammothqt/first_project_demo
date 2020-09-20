class TestsController < ApplicationController
	before_action :set_test, only: [:show, :edit, :update, :destroy]

	def new
		@test = Test.new
		@question = @test.questions.build
		4.times { @answer = @question.answers.build }
	end

	def index
		@tests = Test.all
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
		if @test.update(test_params)
			flash[:success] = "Test has been update!"
			render "show"
		else
			render "edit"
		end
	end

	def destroy
		flash[:success] = "Test has been deleted!" if @test.destroy!
		redirect_to  tests_path
	end

	private
	def test_params
		params.require(:test).permit(:id, :name, :description,
			questions_attributes: [:id, :content, answers_attributes: [:id, :content, :correct_answer]])
	end

	def set_test
		@test = Test.find_by_id params[:id]
	end

	def edit_test_params
		params.require(:test).permit(:name, :description)
	end
end

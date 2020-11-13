class UpdateUserResult
  def initialize user_result
    @user_result = user_result
  end

  def perform
  	@user_result.update grade: @user_result.number_correct_answer
  	@user_result.update status: user_result_status(@user_result.grade)
  end

  private

  def user_result_status grade
    grade < 8 ? 0 : 1
  end
end

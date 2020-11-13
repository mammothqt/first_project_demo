class ComputeGradeService
  def initialize user_result
  	@user_result = user_result
  	@user_answers = user_result.user_answers
  end

  def perform
  	UpdateUserAnswer.new(@user_result.user_answers).perform
    UpdateUserResult.new(@user_result).perform
  end
end

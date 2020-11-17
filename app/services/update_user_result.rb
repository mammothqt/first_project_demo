class UpdateUserResult

  def initialize(user_result)
    @user_result = user_result
  end

  def perform
    user_result.update!(grade: user_result.number_correct)
    user_result.update!(status: result_status(user_result.grade))
  end

  private

  attr_reader(:user_result)

  def result_status(grade)
    grade > Settings.user_result.pass_grade ? true : false
  end
end

class UpdateUserResult

  def initialize(user_result)
    @user_result = user_result
  end

  def perform
    user_result.update!(grade: user_result.number_correct)
    user_result.update!(status: result_status(user_result.grade))
    sending_mail if user_result.pass?
  end

  private

  attr_reader(:user_result)

  def result_status(grade)
    grade > Settings.user_result.pass_grade ? :pass : :fail
  end

  def sending_mail
    SendEmailJob.perform_now(user_result.user, user_result.test, user_result.grade)
  end
end

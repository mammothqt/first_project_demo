class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user, test, grade)
    UserMailer.congrat_passed_user(user, test, grade).deliver_now
  end
end

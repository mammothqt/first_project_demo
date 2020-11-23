class UserMailer < ActionMailer::Base
  include Devise::Mailers::Helpers

  default from: ENV['GMAIL_USERNAME']

  def confirmation_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def congrat_passed_user(user, test, grade)
    @user = user
    @test = test
    @grade = grade
    mail(to: @user.email, subject: t('mailer.subject.user_result', name: @user.full_name, test: @test.name))
  end
end

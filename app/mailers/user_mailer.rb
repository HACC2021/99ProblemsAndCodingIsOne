class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    mail(to: :email , subject: 'Email changed')
  end
end
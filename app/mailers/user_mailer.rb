class UserMailer < ApplicationMailer
  def body_register_municipe(user)
    mail(to: user, subject: 'Test Email for Letter Opener')
  end
end

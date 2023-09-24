class UserMailer < ApplicationMailer
  def body_register_municipe(body_email)
    @origin = body_email[1]
    @municipe = body_email[0]
    mail(to: @municipe.email, subject: "#{@origin} de Municipio")
  end
end

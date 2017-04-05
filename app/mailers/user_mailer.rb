class UserMailer < ApplicationMailer
  default from: "fake@bro-reps.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
      :to => "andrea@crawford.cc",
      :subject => "A new contact form message from #{name}")
  end

end

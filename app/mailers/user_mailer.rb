class UserMailer < ApplicationMailer
  default from: "fake@bro-reps.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
      :to => "andrea@crawford.cc",
      :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
  @appname = "Bro Reps"
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
  end

  def payment_confirmation(user, product)
    @user = user
    @product = product
    mail( :to => user.email,
          :subject => "Payment confirmation")
  end
end

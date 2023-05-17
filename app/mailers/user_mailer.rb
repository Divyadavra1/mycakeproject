# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # default from: 'notifications@example.com'
  # def user_created
  #     @greeting = "Hi"
  #     mail(
  #      from: "support@gmail.com",
  #      to: User.first.email,
  #      cc: User.all.pluck(:email),
  #      bcc: "secret@gmail.com",
  #      subject: "Welcome"
  #     )
  def user_created(user)
    @user = user
    mail to: 'divya.davra@softices.com', subject: 'Welcome to My Awesome Site'
  end
end

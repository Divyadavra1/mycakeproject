# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def user_created
    user = User.last
    UserMailer.user_created(user)
  end
end

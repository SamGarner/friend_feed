class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = new_user_session_url
    mail(to: @user.email, subject: 'Welcome to FriendFeed!')
  end
end

class UserMailer < ApplicationMailer
  default from: 'ioioinfo@163.com' 
  def welcome_email(user)
    @user = user
    @url = 'http://'
    mail(to: user.email,subject: 'Welcome to My Awesome Site')
  end
end

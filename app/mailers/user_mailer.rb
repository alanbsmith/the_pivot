class UserMailer < ActionMailer::Base
  default from: "employmeplease@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://employme.com/login'
    mail(to: @user.email, subject: 'Welcome to EmployMe!')
  end
end

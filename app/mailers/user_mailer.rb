class UserMailer < ActionMailer::Base
  default from: "Progressor"

  def welcome_email(user)
    @user = user
    @url  = 'http://progressorio.herokuapp.com'
    email_with_name = "#{@user.name} <#{@user.email}>"
    mail(to: email_with_name, subject: 'Welcome to Progressor')
  end

end

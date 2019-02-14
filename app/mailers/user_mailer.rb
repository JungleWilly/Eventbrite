class UserMailer < ApplicationMailer
  default from: 'bebeloued@troploin.fr'

  def welcome_email(user)
    @user = user

    @url= 'http://bebeloued.fr/login'

    #mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def new_attendance(attendance)
    @attendance = attendance

    @url = 'www.balbla.com'

    mail(to: @attendance.event.user.email, subject: 'un nouveau participant cest inscrit')
  end

end

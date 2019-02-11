class UserMailer < ApplicationMailer
  default from: 'bebeloued@troploin.fr'

  def welcome_email(user)
    @user = user

    @url= 'http://bebeloued.fr/login'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

end

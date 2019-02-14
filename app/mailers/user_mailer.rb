class UserMailer < ApplicationMailer
  default from: 'bebeloued@troploin.fr'

  def welcome_email(user)
    @user = user

    @url= 'http://bebeloued.fr/login'

    #mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def attendance_send(event, creator, participant)
    #on récupère les instance pour les passer a la view
    @event = event
    @nb = event.users.length
    @creator = creator 
    @participant = participant
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @creator.email, subject: 'encore un participant') 
end

end

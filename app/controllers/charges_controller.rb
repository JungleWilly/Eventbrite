class ChargesController < ApplicationController

  #require 'dotenv'
  #Dotenv.load
  def new
    params.permit(:event)
    @event_id = params[:event]
    @event = Event.find(@event_id)
    session[:price] = @event.price * 100
  end
  
  def create  
    # Amount in cents
    @amount = session[:price]
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    puts customer.id
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

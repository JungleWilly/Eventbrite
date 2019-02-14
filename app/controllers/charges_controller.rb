class ChargesController < ApplicationController
 after_action :new_attendance, only: [:create]
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
  
    @charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
  params.permit(:event)
  @event_id = params[:event]
  @a = customer.id 
  @b = Stripe::Customer.retrieve(@a)[:id]

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


  def new_attendance
    if @b == @a
      bla = Attendance.new(stripe_customer_id: @b, user_id: current_user.id, event_id: @event_id)
      bla.save
      flash[:success] = "Tu as été enregistré"
    end
  end
end

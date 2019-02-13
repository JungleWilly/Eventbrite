class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit]
  before_action :is_user_new_for_event?, only: [:show]
  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(events_params)
    puts event.inspect
    event.creator_id = current_user.id
    event.save
    redirect_to event_path(event.id)
  end

  def show
    @event = Event.find(params[:id])
    @end_date = @event.start_date + @event.duration
    @subscriber = is_user_new_for_event?
    @admin = is_admin?
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def events_params
    params.require(:event).permit(:creator_id, :start_date, :duration, :title, :description, :price, :location)
  end
end

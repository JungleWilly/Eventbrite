class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit]

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

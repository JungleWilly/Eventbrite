class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit]

  def index
    params.permit(:event)
    @event_id = params[:event]
    @all = Attendance.where(event_id: @event_id)
  
  end

  def new
    params.permit(:event)
    @event_id = params[:event]
    @user = User.find(current_user.id)
    byebug
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

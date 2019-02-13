class ApplicationController < ActionController::Base
  def is_admin?
    post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id])
    current_user.id == @event.creator_id
  end

  def is_user_new_for_event?
    post_params = params.permit(:id)
    @event = Event.find_by(id: params[:id])
    current_user != @event.creator && current_user != @event.attendances.find_by(user_id: current_user.id)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def index
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @user_events = @user.created_events
    puts @user_events
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def same_id
    unless current_user == (params[:id]).to_i
      redirect_to new_user_session_path
    else

    end
  end
end

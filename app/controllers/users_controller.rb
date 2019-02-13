class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :same_id, only: [:show]

  def index
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @user_events = @user.created_events
    puts current_user.id
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to root_path
  end

  def destroy
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end

  def same_id
    puts current_user.id
    unless current_user.id == (params[:id]).to_i
      redirect_to root_path
    end
  end
end

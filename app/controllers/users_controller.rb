class UsersController < ApplicationController
  before_action :redirect_user, only: [:new, :create]
  before_action :require_user, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
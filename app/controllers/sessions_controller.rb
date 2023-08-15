class SessionsController < ApplicationController
  before_action :redirect_user, only: [:new, :create]
  
  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:alert] = "something went wrong"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
    redirect_to sign_in_path
  end
end
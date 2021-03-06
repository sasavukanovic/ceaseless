class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    #session[:user_id] = nil
    redirect_to login_path, notice: "Logged out"
  end

end

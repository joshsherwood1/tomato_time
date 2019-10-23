class SessionsController < ApplicationController
  def new
    @new ||= User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:google_token])
      session[:user_id] = user.id
      redirect_to "/profile"
    else
      flash[:error] = 'Looks like your email or password is invalid'
      render :new
    end
  end
end

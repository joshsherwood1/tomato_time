class UsersController < ApplicationController
  def new
      @user = User.new
    end

    def create
      user = User.create(user_params)
      if user.save
        session[:user_id] = user.id
      else
        flash[:error] = user.errors.full_messages.to_sentence
        render :new
      end
    end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :google_token)
  end
end

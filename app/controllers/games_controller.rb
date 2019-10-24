class GamesController < ApplicationController
  def index
    @games = current_user.games
    @user = current_user
  end
end

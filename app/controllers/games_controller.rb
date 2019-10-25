class GamesController < ApplicationController
  def index
    @games = current_user.games
    @user = current_user
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_path
  end
end

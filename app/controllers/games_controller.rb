class GamesController < ApplicationController

  def new

  end

  def create
    game = current_user.games.create(game_params)
    if game.save
      #QuestionAnswersApi.new(game).get_questions_and_answers
      redirect_to "/games"
    else
      flash[:error] = game.errors.full_messages.to_sentence
      redirect_to "/games/new"
    end
  end

  private

  def game_params
    params.permit(:custom_name, :number_of_questions, :category, :difficulty)
  end
end

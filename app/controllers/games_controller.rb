require 'game'

class GamesController < ApplicationController

  def game
    @grid = generate_grid(9)
    @start = Time.now
    if session[:nb_of_games]
      session[:nb_of_games] += 1
    else
      session[:nb_of_games] = 1
    end
  end

  def score
    @attempt = params[:attempt]
    @grid = params[:grid].split("")
    @result = run_game(@attempt, @grid, params[:start].to_datetime, Time.now)
  end

end




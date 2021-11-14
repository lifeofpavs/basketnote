class BoardsController < ApplicationController

  def index
    @points_a ||= 0
    @points_b ||= 0
    @players_a = session[:players_a] || []
    @players_b = session[:players_b] || []
    @loser_message ||= ''
  end
end

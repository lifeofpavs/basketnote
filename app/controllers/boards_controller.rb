class BoardsController < ApplicationController
  before_action :set_board, only: %i[ show edit update destroy ]

  # GET /boards or /boards.json
  def index
    @points_a ||= 0
    @points_b ||= 0
    @players_a ||= []
    @players_b ||= []
    @loser_message ||= ''
  end
end

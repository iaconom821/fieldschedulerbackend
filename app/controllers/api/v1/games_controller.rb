class Api::V1::GamesController < ApplicationController
  skip_before_action :authorized, only: [:index]
  before_action :set_game, only: [:show, :update, :destroy, :authorized]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    if @game.player_id == logged_in_player.id
      @game.destroy
    else
      render json: { message: "Unauthorized" }, status: :unauthorized  
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:field_id, :player_id, :start_time, :end_time, :recommended_skill, :price)
    end
end

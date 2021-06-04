class Api::V1::PlayersController< ApplicationController
  skip_before_action :authorized, only: [:create, :login]
  before_action :set_player, only: [:show, :update, :destroy]

  # GET /players
  def index
    @players = Player.all

    render json: @players
  end

  # GET /players/1
  def show
    render json: @player
  end

  # POST /players
  def create
    new_hash=player_params
    new_hash[:password] = params[:password]
    @player = Player.create(new_hash )
    if @player.valid?
      token = encode_token({player_id: @player.id})
      render json: {player: @player, token: token}
    else
      render json: {error: "Invalid username or password"}
    end

  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  def login
    @player = Player.find_by(username: params[:username])

    if @player && @player.authenticate(params[:password])
      token = encode_token({player_id: @player.id})
      render json: {player: @player, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @player
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :age, :skill_level, :username, :password)
    end
end

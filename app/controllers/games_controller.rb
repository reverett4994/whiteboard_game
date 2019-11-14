class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def guesser
    gon.url = current_user.op_url
    gon.user = current_user.id
  end

  def make_drawer
    @user = User.where("email LIKE ?",params[:user])
    @user = @user.last
    @game = @user.game
    @game.users.each do |u|
      u.guesser = true
      u.save
    end
    @user.guesser = false
    @user.save
  end
  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    current_user.game=@game
    current_user.save
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_opp
    opp = params[:opp]
    new_game = params[:game]
    new_game = Game.find(new_game)
    opp = User.where("email LIKE ?",opp)
    opp=opp.last
    opp.game= new_game
    opp.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.fetch(:game, {}).permit(:users)
    end
end

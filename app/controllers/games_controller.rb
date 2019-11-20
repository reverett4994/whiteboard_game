class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def guesser
    gon.url = current_user.op_url
    gon.user = current_user.id
  end

  def guess
    @guess = params[:guess]
    @gameid = params[:game]
    @game = Game.find(@gameid)
    if @guess.downcase == @game.thing.name.downcase
      @game.completed = true
      @game.winner = current_user.username
      @game.save
      respond_to do |format|
        format.html { redirect_to @game, notice: 'YAY YOU WIN!!!!!' }
      end
    else
        flash[:notice] = 'WRONG'
        redirect_back(fallback_location: root_path)
    end
  end

  def check
    @game = current_user.game
    if @game.completed  
      respond_to do |format|
        format.json { render :js => "window.location = '/'" }

      end
    end
  end

  def start
    if params[:user]
      @drawer = User.where("username LIKE ?",params[:user])
      @drawer = @drawer.last
      @game = @drawer.game
      @game.users.each do |u|
        if u != @drawer 
          u.guesser = true
          u.save
        end

      end
      @drawer.guesser = false
      @drawer.save

      if current_user == @drawer
        redirect_to '/drawer'
      else
        redirect_to '/guesser'
      end
    else
      if current_user.guesser == true
        redirect_to '/guesser'
      else
        redirect_to '/drawer'
      end
    end

  end

  def drawer
    gon.user = current_user
  end

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  def your_game
    @user=current_user
    @game=@user.game
    redirect_to "/games/#{@game.id}"
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
    @game.thing = Thing.order("RAND()").first
    @game.save
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
    opp = User.where("username LIKE ?",opp)
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
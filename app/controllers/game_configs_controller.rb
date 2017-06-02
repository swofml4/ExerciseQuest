class GameConfigsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game_config, only: [:show, :edit, :update, :destroy]

  # GET /game_configs
  # GET /game_configs.json
  def index
    @game_configs = GameConfig.all
  end

  # GET /game_configs/1
  # GET /game_configs/1.json
  def show
  end

  # GET /game_configs/new
  def new
    @game_config = GameConfig.new
  end

  # GET /game_configs/1/edit
  def edit
  end

  # POST /game_configs
  # POST /game_configs.json
  def create
    @game_config = GameConfig.new(game_config_params)

    respond_to do |format|
      if @game_config.save
        format.html { redirect_to @game_config, notice: 'Game config was successfully created.' }
        format.json { render :show, status: :created, location: @game_config }
      else
        format.html { render :new }
        format.json { render json: @game_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_configs/1
  # PATCH/PUT /game_configs/1.json
  def update
    respond_to do |format|
      if @game_config.update(game_config_params)
        format.html { redirect_to @game_config, notice: 'Game config was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_config }
      else
        format.html { render :edit }
        format.json { render json: @game_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_configs/1
  # DELETE /game_configs/1.json
  def destroy
    @game_config.destroy
    respond_to do |format|
      format.html { redirect_to game_configs_url, notice: 'Game config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_config
      @game_config = GameConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_config_params
      params.require(:game_config).permit(:level_rate, :level_method, :decay_per_day)
    end
end

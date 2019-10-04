class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def index
    @games = Game.all
  end

  def edit
    @game = Game.find(params[:id])
    @villagers = @game.villagers
    @items = @game.items
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_back(fallback_location: villagers_path)
    else
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(game_params)

    if @game.save
      redirect_to game_path
    else
      render :edit
    end
  end

  def show
    @game = Game.find(params[:id])
    @villagers = get_villagers
    @items = get_items
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    render games_path
  end

  private
    def game_params
      params.require(:game).permit(:name)
    end

    def get_villagers
      Villager.where(game_id: @game.id)
    end

    def get_items
      Item.where(game_id: @game.id)
    end
end

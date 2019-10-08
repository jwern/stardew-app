class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def index
    @game = Game.new
    @games = Game.all

    render layout: 'no_footer'
  end

  def edit
    @game = Game.find(params[:id])
    @villagers = @game.villagers
    @items = @game.items
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def show
    @game = Game.find(params[:id])
    @villagers = get_villagers
    @items = get_items
    @notes = get_notes
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
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

    def get_notes
      Note.where(game_id: @game.id).sort_by_type
    end
end

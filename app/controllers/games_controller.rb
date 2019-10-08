class GamesController < ApplicationController
  before_action :get_game, except: [:new, :index, :create]

  def new
    @game = Game.new

    render layout: 'no_footer'
  end

  def index
    @game = Game.new
    @games_all = Game.all
    if params[:search]
      @games = @games_all.search(params[:search])
    else
      @games = @games_all
    end

    render layout: 'no_footer'
  end

  def edit
    @villagers = @game.villagers
    @items = @game.items
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render :new, layout: 'no_footer'
    end
  end

  def update
    @game.update_attributes(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def show
    @villagers = get_villagers
    @items = get_items
    @notes = get_notes
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  private
    def game_params
      params.require(:game).permit(:name, :search)
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

    def get_game
      @game = Game.find(params[:id])
    end
end

class GamesController < ApplicationController
  include CreateFoldersHelper
  include ApplicationHelper
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
      create_game_folder(@game.name)
      redirect_to game_path(@game)
    else
      render :new, layout: 'no_footer'
    end
  end

  def update
    @game_old = Game.find(params[:id])
    @game.update_attributes(game_params)

    if @game.save
      edit_game_folder(@game_old.name, @game.name)
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
    ## Decided against deleting image folders when a game is deleted in case
    ## the deletion is a mistake or user decides to undo.  This method is also
    ## commented out in the CreateFoldersHelper.

    # delete_game_folder(@game.name)
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

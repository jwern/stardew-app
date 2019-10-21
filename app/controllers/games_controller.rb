class GamesController < ApplicationController
  ## Removed folder creation for now.
  # include CreateFoldersHelper
  include ApplicationHelper
  before_action :get_game, except: [:new, :index, :create]
  before_action :no_footer, only: [:new, :index, :create]

  def new
    @game = Game.new
  end

  def index
    @game = Game.new
    @games_all = Game.all
    if params[:search]
      @games = @games_all.search(params[:search])
    else
      @games = @games_all
    end
  end

  def edit
    @villagers = @game.villagers
    @items = @game.items
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      ## Removed folder creation for now: Heroku won't accept file creation outside
      ## the database or a separate cloud storage solution (like Amazon).
      # create_game_folder(@game.name)
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def update
    ## This instance variable is only used for folder creation.
    # @game_old = Game.find(params[:id])
    @game.update_attributes(game_params)

    if @game.save
      ## Removed folder creation until we switch to a cloud storage option.
      # edit_game_folder(@game_old.name, @game.name)
      redirect_to game_path(@game)
    else
      @villagers = @game.villagers
      @items = @game.items
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

  def no_footer
    @no_footer = true
  end

  private
    def game_params
      params.require(:game).permit(:name, :color_choice, :search)
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

class VillagersController < ApplicationController
  before_action :get_game

  def new
    @villager = @game.villagers.new
  end

  def index
    @villagers_all = @game.villagers
    if params[:search]
      @villagers = @villagers_all.search(params[:search])
    elsif params[:filter]
      @villagers = @villagers_all.filter(:birth_season, params[:filter])
    else
      @villagers = @villagers_all
    end
  end

  def create
    @villager = @game.villagers.new(villager_params)

    if @villager.save
      redirect_to game_villager_path(@game, @villager)
    else
      render :new
    end
  end

  def show
    @villager = @game.villagers.find(params[:id])

    @preferences = get_prefs
    @likes = get_opinions("Likes")
    @dislikes = get_opinions("Dislikes")

    # @villagers = get_preferred(@game, "villagers")
    # @items = get_preferred(@game, "items")
  end

  def edit
    @villager = @game.villagers.find(params[:id])
    @preferences = get_prefs
  end

  def update
    @villager = @game.villagers.find(params[:id])

    @villager.update_attributes(villager_params)

    if @villager.save
      redirect_to game_villager_path
    else
      render :edit
    end
  end

  def destroy
    @villager = @game.villagers.find(params[:id])
    @villager.destroy
    redirect_to game_villagers_path
  end

  private
    def villager_params
      params.require(:villager).permit(:name, :birth_day, :birth_season, :extra_info, :search, :filter)
    end

    def get_prefs
      Preference.where(villager_id: @villager.id)
    end

    def get_opinions(pref)
      @preferences.select { |prefs| prefs.opinion == pref }
      .map { |like| Item.find(like.item_id) }
    end

    def get_game
      @game = Game.find(params[:game_id])
    end

    # def get_game_name
    #   if @villager.game_id.nil?
    #     "None"
    #   else
    #     Game.find(@villager.game_id).name
    #   end
    # end
end

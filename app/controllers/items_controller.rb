class ItemsController < ApplicationController
  before_action :get_game

  def new
    @item = @game.items.new
  end

  def index
    #@items = Item.all
    @items_all = @game.items
    if params[:search]
      @items = @items_all.search(params[:search])
    elsif !params[:filter].blank?
      @items = @items_all.filter(:category, params[:filter])
    else
      @items = @items_all
    end
  end

  def create
    @item = @game.items.new(item_params)

    if @item.save
      redirect_to game_item_path(@game, @item)
    else
      render :new
    end
  end

  def show
    @item = @game.items.find(params[:id])

    @preferences = get_prefs
    @likes = get_opinions("Likes")
    @dislikes = get_opinions("Dislikes")

    # Because Preferences are only accessed from the item and villager show pages,
    # needed to pass game and item scope in...but doing it via @game now
    # @villagers = get_preferred(@game, "villagers")
    # @items = get_preferred(@game, "items")
    # @villagers = @game.villagers
    # @items = @game.items
  end

  def edit
    @item = @game.items.find(params[:id])
    @preferences = get_prefs
  end

  def update
    @item = @game.items.find(params[:id])

    @item.update_attributes(item_params)

    if @item.save
      redirect_to game_item_path
    else
      render :edit
    end
  end

  def destroy
    @item = @game.items.find(params[:id])
    @item.destroy
    redirect_to game_items_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :category, :sale_price, :extra_info, :search, :filter)
    end

    def get_prefs
      Preference.where(item_id: @item.id)
    end

    def get_opinions(pref)
      @preferences.select { |prefs| prefs.opinion == pref }
      .map { |like| Villager.find(like.villager_id) }
    end

    def get_game
      @game = Game.find(params[:game_id])
    end

    # def get_game_name
    #   if @item.game_id.nil?
    #     "None"
    #   else
    #     Game.find(@item.game_id).name
    #   end
    # end

    #def find_villager_names(villagers)
      #Villager.find(villagers.villager_id).name
    #end
end

class ItemsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @item = @game.items.new
  end

  def index
    #@items = Item.all
    @game = Game.find(params[:game_id])
    @items_all = @game.items
    if params[:search]
      @items = @items_all.search(params[:search])
    elsif params[:filter]
      @items = @items_all.filter(:category, params[:filter])
    else
      @items = @items_all
    end
  end

  def create
    @game = Game.find(params[:game_id])
    @item = @game.items.new(item_params)

    if @item.save
      redirect_to game_item_path(@game, @item)
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:game_id])
    @item = @game.items.find(params[:id])

    @preferences = get_prefs
    @likes = get_opinions("Likes")
    @dislikes = get_opinions("Dislikes")
  end

  def edit
    @game = Game.find(params[:game_id])
    @item = @game.items.find(params[:id])
    @preferences = get_prefs
  end

  def update
    @game = Game.find(params[:game_id])
    @item = @game.items.find(params[:id])

    @item.update_attributes(item_params)

    if @item.save
      redirect_to game_item_path
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
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

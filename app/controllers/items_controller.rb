class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    #@items = Item.all
    if params[:search]
      @items = Item.search(params[:search])
    elsif params[:filter]
      @items = Item.filter(:category, params[:filter])
    else
      @items = Item.all
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])

    @preferences = get_prefs
    @likes = get_opinions("Likes")
    @dislikes = get_opinions("Dislikes")
    @game = get_game
  end

  def edit
    @item = Item.find(params[:id])
    @preferences = get_prefs
  end

  def update
    @item = Item.find(params[:id])

    @item.update_attributes(item_params)

    if @item.save
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :category, :sale_price, :extra_info, :search, :filter, :game_id)
    end

    def get_prefs
      Preference.where(item_id: @item.id)
    end

    def get_opinions(pref)
      @preferences.select { |prefs| prefs.opinion == pref }
      .map { |like| Villager.find(like.villager_id) }
    end

    def get_game
      if @item.game_id.nil?
        "None"
      else
        Game.find(@item.game_id).name
      end
    end

    #def find_villager_names(villagers)
      #Villager.find(villagers.villager_id).name
    #end
end

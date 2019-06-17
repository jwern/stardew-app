class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
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
  end

  def edit
    @item = Item.find(params[:id])
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
      params.require(:item).permit(:name, :category, :sale_price)
    end

    def find_villager_names(villagers)
      Villager.find(villagers.villager_id).name
    end

    def get_prefs
      Preference.select { |prefs| prefs.item_id == @item.id }
    end

    def get_opinions(pref)
      @preferences.select { |prefs| prefs.opinion == pref }
      .map { |like| Villager.find(like.villager_id) }
    end
end

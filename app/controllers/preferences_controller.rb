class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
  end

  def index
    @preferences = Preference.all
    redirect_to controller: 'games', action: 'index'
  end

  def create
    @preference = Preference.new(preference_params)
    @game = get_game
    # @url = request.referrer
    # @villagers = get_preferred(@game, "villagers")
    # @items = get_preferred(@game, "items")
    #@villager = Villager.find(@preference.villager_id)

    if @preference.save
      redirect_back(fallback_location: game_villagers_path(@game))
    else
      render :new
    end
  end

  def show
    @preference = Preference.find(params[:id])
  end

  def destroy
    @preference = Preference.find(params[:id])
    @game = get_game
    @preference.destroy
    redirect_back(fallback_location: game_villagers_path(@game))
  end

  private
    def preference_params
      params.require(:preference).permit(:villager_id, :item_id, :opinion)
    end

    def get_game
      if @preference.villager_id.present?
        @villager = Villager.find(@preference.villager_id)
        Game.find { |game| game.id == @villager.game_id }
      else
        @item = Item.find(@preference.item_id)
        Game.find { |game| game.id == @item.game_id }
      end
    end
end

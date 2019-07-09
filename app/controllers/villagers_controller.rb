class VillagersController < ApplicationController
  def new
    @villager = Villager.new
  end

  def index
    #@villagers = Villager.all
    if params[:search]
      @villagers = Villager.search(params[:search])
    elsif params[:filter]
      @villagers = Villager.filter(:birth_season, params[:filter])
    else
      @villagers = Villager.all
    end
  end

  def create
    @villager = Villager.new(villager_params)

    if @villager.save
      redirect_to @villager
    else
      render :new
    end
  end

  def show
    @villager = Villager.find(params[:id])

    @preferences = get_prefs
    @likes = get_opinions("Likes")
    @dislikes = get_opinions("Dislikes")
  end

  def edit
    @villager = Villager.find(params[:id])
    @preferences = get_prefs
  end

  def update
    @villager = Villager.find(params[:id])

    @villager.update_attributes(villager_params)

    if @villager.save
      redirect_to @villager
    else
      render :edit
    end
  end

  def destroy
    @villager = Villager.find(params[:id])
    @villager.destroy
    redirect_to villagers_path
  end

  private
    def villager_params
      params.require(:villager).permit(:name, :birth_day, :birth_season, :search, :filter)
    end

    def get_prefs
      Preference.where(villager_id: @villager.id)
    end

    def get_opinions(pref)
      @preferences.select { |prefs| prefs.opinion == pref }
      .map { |like| Item.find(like.item_id) }
    end
end

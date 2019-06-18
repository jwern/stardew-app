class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
  end

  def index
    @preferences = Preference.all
  end

  def create
    @preference = Preference.new(preference_params)
    #@villager = Villager.find(@preference.villager_id)

    if @preference.save
      redirect_back(fallback_location: villagers_path)
    else
      render :new
    end
  end

  def show
    @preference = Preference.find(params[:id])
  end

  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy
    redirect_back(fallback_location: preferences_path)
  end

  private
    def preference_params
      params.require(:preference).permit(:villager_id, :item_id, :opinion)
    end
end

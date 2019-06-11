class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)

    if @preference.save
      redirect_to villagers_path
    else
      render :new
    end
  end

  def show
    @preference = Preference.find(params[:id])
  end

  private
    def preference_params
      params.require(:preference).permit(:villager_id, :item_id, :opinion)
    end
end

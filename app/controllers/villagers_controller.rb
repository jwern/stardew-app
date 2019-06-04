class VillagersController < ApplicationController
  def new
    @villager = Villager.new
  end

  def index
    @villagers = Villager.all
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
  end

  def edit
    @villager = Villager.find(params[:id])
  end

  def update
    @villager = Villager.find(params[:id])

    @villager.update_attributes(villager_params)
    @villager.save
    redirect_to @villager
  end

  def destroy
    @villager = Villager.find(params[:id])
    @villager.destroy
    redirect_to villagers_path
  end

  private
    def villager_params
      params.require(:villager).permit(:name, :birth_day, :birth_season)
    end
end

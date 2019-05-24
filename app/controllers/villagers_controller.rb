class VillagersController < ApplicationController
  def new
  end

  def index
    @villagers = Villager.all
  end

  def create
    @villager = Villager.new(villager_params)

    @villager.save
    redirect_to @villager
  end

  def show
    @villager = Villager.find(params[:id])
  end

  def edit
    @villager = Villager.find(params[:id])
  end

  def update
    @villager = Villager.find(params[:id])

    case params[:submit]
    when "edit"
      @villager.update_attributes(villager_params)
      @villager.save
      redirect_to @villager
    when "delete"
      @villager.destroy
      redirect_to action: 'index'
    end
  end

  private
    def villager_params
      params.require(:villager).permit(:name)
    end
end

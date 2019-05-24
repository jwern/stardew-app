class VillagersController < ApplicationController
  def new
  end

  def index
    @villagers = Villager.all
  end

  def create
    @villager = Villager.new(article_params)

    @villager.save
    redirect_to @villager
  end

  def show
    @villager = Villager.find(params[:id])
  end

  private
    def article_params
      params.require(:villager).permit(:name)
    end
end

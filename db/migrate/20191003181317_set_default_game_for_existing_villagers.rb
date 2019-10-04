class SetDefaultGameForExistingVillagers < ActiveRecord::Migration[5.2]
  def up
    Villager.update_all(game_id: Game.where(name: "Stardew Valley").first.id)
  end

  def down
    Villager.update_all(game_id: nil)
  end
end

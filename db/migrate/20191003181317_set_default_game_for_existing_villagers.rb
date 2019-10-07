class SetDefaultGameForExistingVillagers < ActiveRecord::Migration[5.2]
  def up
    game = Game.find_or_create_by(name: "Stardew Valley")

    Villager.update_all(game_id: game.id)
  end

  def down
    Villager.update_all(game_id: nil)

    Game.find_by(name: "Stardew Valley").destroy
  end
end

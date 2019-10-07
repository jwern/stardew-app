class SetDefaultGameForExistingItems < ActiveRecord::Migration[5.2]
  def up
    Item.update_all(game_id: Game.where(name: "Stardew Valley").first.id)
  end

  def down
    Item.update_all(game_id: nil)
  end
end

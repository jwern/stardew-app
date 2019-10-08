class SetDefaultGameForExistingNotes < ActiveRecord::Migration[5.2]
  def up
    Note.update_all(game_id: Game.where(name: "Stardew Valley").first.id)
  end

  def down
    Note.update_all(game_id: nil)
  end
end

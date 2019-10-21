class SetDefaultColorForExistingGames < ActiveRecord::Migration[5.2]
  def up
    Game.update_all(color_choice: "blue-red")
  end

  def down
    Game.update_all(color_choice: nil)
  end
end

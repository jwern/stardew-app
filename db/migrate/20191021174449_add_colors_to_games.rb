class AddColorsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :color_choice, :text
  end
end

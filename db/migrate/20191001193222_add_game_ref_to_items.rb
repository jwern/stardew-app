class AddGameRefToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :game, foreign_key: true
  end
end

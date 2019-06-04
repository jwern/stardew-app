class AddBirthdaysToVillagers < ActiveRecord::Migration[5.2]
  def change
    add_column :villagers, :birth_season, :text
    add_column :villagers, :birth_day, :integer
  end
end

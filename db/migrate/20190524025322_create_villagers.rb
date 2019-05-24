class CreateVillagers < ActiveRecord::Migration[5.2]
  def change
    create_table :villagers do |t|
      t.string :name

      t.timestamps
    end
  end
end

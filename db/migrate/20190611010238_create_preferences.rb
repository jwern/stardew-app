class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.references :villager, foreign_key: true
      t.references :item, foreign_key: true
      t.string :opinion

      t.timestamps
    end
  end
end

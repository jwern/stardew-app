class AddTextFieldToVillagers < ActiveRecord::Migration[5.2]
  def change
    add_column :villagers, :extra_info, :text
  end
end

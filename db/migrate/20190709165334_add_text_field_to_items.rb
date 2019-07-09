class AddTextFieldToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :extra_info, :text
  end
end

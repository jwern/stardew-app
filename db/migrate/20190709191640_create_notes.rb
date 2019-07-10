class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :additional_info
      t.string :info_type

      t.timestamps
    end
  end
end

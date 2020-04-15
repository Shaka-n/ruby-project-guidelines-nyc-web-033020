class CreateItem < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :grabbable_id
      t.string :grabbale_type
    end
    add_index :items, [:grabbable_type, :grabbable_id]
  end
end

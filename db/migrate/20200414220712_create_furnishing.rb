class CreateFurnishing < ActiveRecord::Migration[5.0]
  def change
    create_table :furnishings do
      t.string :name
      t.string :room_id
    end
  end
end

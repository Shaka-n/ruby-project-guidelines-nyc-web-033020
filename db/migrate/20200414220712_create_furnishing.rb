class CreateFurnishing < ActiveRecord::Migration[5.0]
  def change
    create_table :furnishings do
      t.string :name
    end
  end
end

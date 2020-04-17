class CreateScore < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.string :name
      t.integer :score
    end
  end
end

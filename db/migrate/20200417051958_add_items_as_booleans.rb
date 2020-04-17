class AddItemsAsBooleans < ActiveRecord::Migration[5.0]
  def change
    add_column(:players, :gloves, :boolean)
    add_column(:players, :mask, :boolean)
  end
end

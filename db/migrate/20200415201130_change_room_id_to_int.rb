class ChangeRoomIdToInt < ActiveRecord::Migration[5.0]
  def change
    change_column :players, :room_id, :integer
    change_column :furnishings, :room_id, :integer
  end
end

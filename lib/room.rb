class Room < ActiveRecord::Base
    has_many :adjacents, class_name: "Room", foreign_key: ":proximal_room_id"
    belongs_to :proximal_room, class_name: "Room", optional:true
    has_many :items, as: :grabbable
end
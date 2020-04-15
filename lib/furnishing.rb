class Furnishing < ActiveRecord::Base
    has_many :items, as: :grabbable
    belongs_to :room
end
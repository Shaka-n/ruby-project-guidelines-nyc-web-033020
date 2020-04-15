class Furnishing < ActiveRecord::Base
    has_many :items, as: :grabbable
end
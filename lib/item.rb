class Item < ActiveRecord::Base
    belongs_to :grabbable, polymorphic: true
end
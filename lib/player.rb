class Player < ActiveRecord::Base
    has_many :items, as: :grabbable

    def search_furnishing
        furnishings = self.room_id.furnishings                      
          furnishing.map {|f| f.id}                                 
            Item.all.each do |i| 
                if i.grabbable_id = furnishing.id
                i.grabbable_id.update(self.id)
                end
            end
        end
    end
                
    
    def self.move_character
    
    end
end
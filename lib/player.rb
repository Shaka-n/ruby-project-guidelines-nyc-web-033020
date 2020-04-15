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

    def current_room 
        Room.all.find_by(id==self.room_id)
    end
            
    def available_rooms
        options = Room.all.select {|r, v| r.proximal_room_id == self.room_id || r.id == (current_room.proximal_id - 1)}
        options
    end

    # Add in error statements and edge cases 
    def move 
        puts "Where do you want to go?"
        puts available_rooms
        input = gets.chomp
        
        if input > available_rooms.length 
            puts "Please choose from the available options."
        else
            input -= 1
            puts "You walk into the #{available_rooms[input]}."
            self.room_id = input
        end
    end

end
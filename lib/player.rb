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
    def available_rooms
        current_room = Room.all.find(id == self.room_id)
        options = Room.all.select do |r|
            r.proximal_room_id == self.room_id || r.id == (current_room.id - 1)
        end
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

    #create visited rooms array

end
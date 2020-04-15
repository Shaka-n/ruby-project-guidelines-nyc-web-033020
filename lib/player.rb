class Player < ActiveRecord::Base
    has_many :items, as: :grabbable

    def decision_loop
        puts "What would you like to do?"
        puts"1. Move
        2. Search/Interact
        3. Check Inventory"
        input = gets.chomp
        if input = 1 
            # Display Available Rooms
        elsif input = 2
            # Display Available Interactions
        elsif input = 3
            # Display Items That Belong to Player
        else
            puts "Please use the number keys to indicate your choice."
        end
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
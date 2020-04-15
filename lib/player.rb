class Player < ActiveRecord::Base
    has_many :items, as: :grabbable

    def search_furnishing
        furnishings = current_room.furnishing                   
          furnishing.each do |f|                             
                Item.all.each do |i| 
                    if i.grabbable_id == f.id
                    i.update_attribute(:grabbable_id, self.id)
                    i.update_attribute(:grabbable_type, self)
                    end
                end
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

    #def win_statement
        #if self.find_by(name: "glove", name: "mask")
            #puts "You found what you were looking for, would you like to go outside?"
            #input = gets.chomp

            #if input = "yes"
                #self.room_id = room10


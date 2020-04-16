class Player < ActiveRecord::Base
    has_many :items, as: :grabbable

    def current_room 
        Room.all.find_by(id==self.room_id)
    end

    def available_rooms
        options = Room.all.select {|r, v| r.proximal_room_id == self.room_id || r.id == (current_room.id - 1)}
        options
    end

    def move 
        puts "Where do you want to go?"
        available_rooms.each do |r|
            puts r.name
        end
        input = $stdin.gets.chomp.to_i
        input -= 1
        if input > available_rooms.length || input < 0
            puts "Please choose from the available options."
        else
            puts "You walk into the #{self.available_rooms[input-1].name}."
            chosen_room = self.available_rooms[input]
            self.room_id = chosen_room.id
        end
    end

    def search_furnishing        
        inside = current_furnishings.items.select  do |f| i.grabbable_id == f.id}      
        if inside.size > 0
            inside.each
            puts "You found #{i.name}"
                    # i.update_attribute(:grabbable, self)
                    end
                    if found = false
                        puts "You didn't find anything."
                    end
                
            
        end

    def current_furnishings
        self.current_room.furnishings
    end

    def what_furnishings 
        current_furnishings.each do |f|
            puts "You see a #{f.name}."
        end
    end

        
    end
                

    # Add in error statements and edge cases 
    

    #def win_statement
        #if self.find_by(name: "glove", name: "mask")
            #puts "You found what you were looking for, would you like to go outside?"
            #input = gets.chomp

            #if input = "yes"
                #self.room_id = room10


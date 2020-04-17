class Player < ActiveRecord::Base
    has_many :items, as: :grabbable

    def current_room 
        Room.all.find(self.room_id)
    end

    def available_rooms
        options = Room.all.select {|r, v| r.proximal_room_id == self.room_id || r.id == (current_room.id - 1)}
        options
    end

    def move 
        puts "Where do you want to go?"
        available_rooms.each_with_index do |r, index|
            puts "#{index+1}. #{r.name}"
        end
        input = $stdin.gets.chomp.to_i
        input -= 1
        if input > available_rooms.length || input < 0
            puts "Please choose from the available options."
        else
            puts "You walk into the #{self.available_rooms[input].name}."
            chosen_room = self.available_rooms[input]
            self.room_id = chosen_room.id
        end
    end

    def search_furnishing(furnishing)      
        inside = furnishing.items
        if inside.size > 0
        inside.each_with_index do |i, index|
                puts "Item ##{index}"
                puts "You found #{i.name}! You put it in your pocket."     
                if i.name == "Gloves"
                        self.gloves = true
                elsif i.name = "Mask"
                        self.mask = true
                else
                    puts "You're not sure what you'll do with that..."
                end
            end
        else 
            puts "You didn't find anything."
        end     
    end

    # def take_item(inside)
        
    #     if input == "yes"
    #         inside[input].update_attribute(:grabbable, self)
    #         puts "You put #{inside[input].name} in your pocket."
    #     elsif input == "no"
    #         puts "You decide to leave it where it is."
    #     else 
    #         puts "You didn't find anything."
    #     end     
    # end

    def current_furnishings
        self.current_room.furnishings
    end

    def what_furnishings 
        current_furnishings.each do |f|
            puts "You see a #{f.name}."
        end
    end

    def open_door
        current_furnishings.each do |f|
            if f[:name] == "Front Door"
                return "You can finally go outside safely!"
            end
        end
    end

    def win_condition
        unless self.gloves
            puts "You still need to find the gloves."
        end
        unless self.mask
            puts "You still need to find the mask."
        end
        if self.gloves && self.mask
            puts "You've found all of your PPE. Now you can safely go outside. Head for the front door."
        end
    end

end


                

     #Add in error statements and edge cases 
    




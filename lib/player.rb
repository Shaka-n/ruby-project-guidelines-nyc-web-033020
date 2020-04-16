class Player < ActiveRecord::Base
    has_many :items, as: :grabbable

    def current_room 
        Room.all.find(self.room_id)
    end

    def available_rooms
        options = Room.all.select {|r, v| r.proximal_room_id == self.room_id || r.id == (current_room.id - 1)}
        options
    end

    def current_furnishings
        self.current_room.furnishings
    end

    def what_furnishings 
        current_furnishings.each do |f|
            puts "You see a #{f.name}."
        end
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
            puts "You walk into the #{self.available_rooms[input-1].name}."
            chosen_room = self.available_rooms[input]
            self.room_id = chosen_room.id
        end
    end

<<<<<<< HEAD
#<<<<<<< HEAD
    # def search_furnishing        
    #     inside = current_furnishings.items.select  do |f| i.grabbable_id == f.id}      
    #         if inside.size > 0
    #             inside.each
    #                 puts "You found #{i.name}"
    #                 # i.update_attribute(:grabbable, self)
    #         end
    #                 if found = false
    #                     puts "You didn't find anything."
    #                 end
                
            
    #     end
    # end
=======
    def search_furnishing(furnishing)      
        inside = furnishing.items
        inside.each_with_index do |i, index|
            if inside.size > 0
                inside.each do |i|
                puts "Item ##{i.index}"
                puts "You found #{i.name}"     
                puts "Would you like to take it? Enter 'yes' or 'no'."
                input = $stdin.gets.chomp
                    if input == "yes"
                        i.update_attribute(:grabbable, self)
                        puts "You put #{inside[input].name} in your pocket."
                    elsif input == "no"
                        puts "You decide to leave it where it is."
                    else 
                        puts "Please type in 'yes' or 'no'."
                    end
                end
            else 
                puts "You didn't find anything."
            end
        end     
    end

    def take_item(inside)
        
        if input == "yes"
            inside[input].update_attribute(:grabbable, self)
            puts "You put #{inside[input].name} in your pocket."
        elsif input == "no"
            puts "You decide to leave it where it is."
        else 
            puts "Please type in 'yes' or 'no'."
        end
    end

    # def print_item_options(inside)
    #     puts "What would you like to take? Please answer with the number keys."
    #     str = "You found"
    #     inside.each_with_index do |i, index|
    #         if index.size == 1
    #             str.concat(" a #{i.name}.")
    #         elsif index == inside.size - 1
    #             str.concat(" and a #{i.name}.")
    #         else 
    #             str.concat(" a #{i.name},")
    #         end
    #         puts str
    #     end
    # end

        # i.update_attribute(:grabbable, self)
>>>>>>> 98187e9d605e8d639c8698e076cb82522c509f14

    

    def open_door
        current_furnishings.each do |f|
            if f == furnishing10
                puts "You can finally go outside safely!"
            end
        end
    end

    def win_statement
        if self.find_by(name: "glove") 
            puts "You found what you were looking for, you can finally go outside!"
            while self.room_id != room10.room_id do
                self.move
                if self.room_id == room10.room_id
                    self.open_door
                end
            end
        end
    end

end


                

     #Add in error statements and edge cases 
    




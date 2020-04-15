class Player < ActiveRecord::Base
    has_many :items, as: :grabbable

    def decision_loop
        puts "What would you like to do?"
        puts"1. Move
        2. Search/Interact
        3. Check Inventory"
        input = gets.chomp
        if input = 1 
            #Display Available Rooms
        elsif input = 2
            #Display Available Interactions
        elsif input = 3
            #Display Items That Belong to Player
        else
            puts "Please use the number keys to indicate your choice."
        end
    end

end
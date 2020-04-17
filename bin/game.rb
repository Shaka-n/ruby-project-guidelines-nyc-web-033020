require_relative '../config/environment'
Room.delete_all
Furnishing.delete_all
Item.delete_all
Player.delete_all

room1 = Room.create(name:"Office")
room2 = Room.create(name:"Back Hallway", proximal_room_id: room1.id)
room3 = Room.create(name:"Bathroom", proximal_room_id: room2.id)
room4 = Room.create(name:"Bedroom", proximal_room_id: room2.id)
room5 = Room.create(name:"Livingroom", proximal_room_id: room2.id)
room6 = Room.create(name:"Kitchen", proximal_room_id: room5.id)
room7 = Room.create(name:"Front Hallway", proximal_room_id: room5.id)
room8 = Room.create(name:"Closet", proximal_room_id: room7.id)
room9 = Room.create(name: "Basement", proximal_room_id: room8.id)
room10 = Room.create(name:"Foyer", proximal_room_id: room7.id)
room11 = Room.create(name:"Outside", proximal_room_id: room10.id)


dresser = Furnishing.create(name:"Dresser",room_id: room4.id)
cupboard = Furnishing.create(name:"Cupboard", room_id: room6.id)
hopechest = Furnishing.create(name:"Hopechest", room_id: room4.id)
refrigerator = Furnishing.create(name:"Refrigerator", room_id: room6.id)
cardboard_box = Furnishing.create(name:"Carboard Box", room_id: room8.id)
shoebox = Furnishing.create(name:"Shoebox", room_id: room8.id)
medicine_cabinet = Furnishing.create(name:"Medicine Cabinet", room_id: room3.id)
desk = Furnishing.create(name:"Desk", room_id: room1.id)
grandfather_clock = Furnishing.create(name:"Grandfather Clock", room_id: room5.id)
spooky_coffin = Furnishing.create(name: "Spooky Coffin", room_id: room9.id)
front_door = Furnishing.create(name: "Front Door", room_id: room10.id)

item1 = Item.create(name:"Gloves", grabbable_id: desk.id, grabbable_type: "Furnishing")
item2 = Item.create(name:"Mask", grabbable_id: medicine_cabinet.id, grabbable_type: "Furnishing")

# player1 = Player.create(name:"Player #1", room_id:room1.id)
#load game assets here
win = false

puts "Hello, welcome to our game.

You've been inside for a while now. 

Maybe it's time for a walk. You'll need your gloves and facemask before you can go outside. 

Before we start, what's your name?"
player_name = gets.chomp

player = Player.create(name:player_name, room_id:room1.id)
#create new player instance here using player_name

puts "Thank you. Welcome to the game, #{player_name}."

puts "You're sitting in your home office at your desk. It's a bit stuffy in here."
turn_counter=0
while win == false
    if player.room_id == room11.id
        puts "You've made it outside! 
        
        Ah, fresh air! Sunlight! How lovely! 
        
        Now you stay safe out there!
        
        Congratulations, You Won."
        Score.create(name:player_name, score:turn_counter)
        break
    end
    turn_counter += 1
    puts "You are standing in the #{player.current_room.name}. What would you like to do?
        1. Move
        2. Search Room
        3. Check Inventory"
    input = $stdin.gets.chomp.to_i
    if input==1 
        player.move
    elsif input==2
        puts "You see:"
        if player.current_furnishings.length == 0
            puts "Nothing."
            next
        else
        player.current_furnishings.each_with_index do |f, index|
            puts "##{index+1} #{f.name}"
            end
        end
        search = false
        while search ==false
            puts "Search which object?"
            input = $stdin.gets.chomp.to_i
            if input > player.current_furnishings.size || input < 0
                puts "That's not an option in this room."
            else 
                search = true
                player.search_furnishing(player.current_furnishings[input-1])
            end
        end
    elsif input == 3
        binding.pry
        puts "Inventory:"
        items = player.items
        items.each {|i|puts i.name}
        player.win_condition
    else
        puts "Please choose from the 3 options above."
    end

end

puts Score.highscores
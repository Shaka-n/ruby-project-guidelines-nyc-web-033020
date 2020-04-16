require_relative '../config/environment'

House.delete_all
Player.delete_all
Room.delete_all
Furnishing.delete_all
Item.delete_all


#house1 = House.create(name:"House #1")


room1 = Room.create(name:"Office")
room2 = Room.create(name:"Hallway #1", proximal_room_id: room1.id)
room3 = Room.create(name:"Bathroom", proximal_room_id: room2.id)
room4 = Room.create(name:"Bedroom", proximal_room_id: room2.id)
room5 = Room.create(name:"Livingroom", proximal_room_id: room2.id)
room6 = Room.create(name:"Kitchen", proximal_room_id: room5.id)
room7 = Room.create(name:"Front Hallway", proximal_room_id: room5.id)
room8 = Room.create(name:"Closet", proximal_room_id: room7.id)
room9 = Room.create(name: "Basement", proximal_room_id: room8.id)
room10 = Room.create(name:"Foyer", proximal_room_id: room7.id)


furnishing1 = Furnishing.create(name:"Dresser",room_id: room4.id)
furnishing2 = Furnishing.create(name:"Cupboard", room_id: room6.id)
furnishing3 = Furnishing.create(name:"Hopechest", room_id: room4.id)
furnishing4 = Furnishing.create(name:"Refrigerator", room_id: room6.id)
furnishing5 = Furnishing.create(name:"Carboard Box", room_id: room8.id)
furnishing6 = Furnishing.create(name:"Shoebox", room_id: room8.id)
furnishing6 = Furnishing.create(name:"Medicine Cabinet", room_id: room3.id)
furnishing7 = Furnishing.create(name:"Desk", room_id: room1.id)
furnishing8 = Furnishing.create(name:"Grandfather Clock", room_id: room5.id)
furnishing9 = Furnishing.create(name: "Spooky Coffin", room_id: room10.id)
furnishing10 = Furnishing.create(name: "Front Door", room_id: room9.id)

item1 = Item.create(name:"Gloves", grabbable_id: furnishing7.id, grabbable_type: "Furnishing")
item2 = Item.create(name:"Mask", grabbable_id: furnishing6.id, grabbable_type: "Furnishing")

player1 = Player.create(name:"Player #1", room_id:room1.id)
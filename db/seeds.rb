House.delete_all
Player.delete_all
Room.delete_all
Furnishing.delete_all
Item.delete_all


house1 = House.create(name:"House #1")
player1 = Player.create(name:"Player #1", room_id:1)

room1 = Room.create(name:"Office")
room2 = Room.create(name:"Hallway #1", proximal_room_id: 1)
room3 = Room.create(name:"Bathroom", proximal_room_id: 2)
room4 = Room.create(name:"Bedroom", proximal_room_id: 2)
room5 = Room.create(name:"Livingroom", proximal_room_id: 2)
room6 = Room.create(name:"Kitchen", proximal_room_id: 5)
room7 = Room.create(name:"Front Hallway", proximal_room_id: 5)
room8 = Room.create(name:"Closet", proximal_room_id:7)
room9 = Room.create(name: "Basement", proximal_room_id: 8)
room10 = Room.create(name:"Foyer", proximal_room_id:7)


furnishing1 = Furnishing.create(name:"Dresser",room_id: 4)
furnishing2 = Furnishing.create(name:"Cupboard", room_id: 6)
furnishing3 = Furnishing.create(name:"Hopechest", room_id: 4)
furnishing4 = Furnishing.create(name:"Refrigerator", room_id: 6)
furnishing5 = Furnishing.create(name:"Carboard Box", room_id: 8)
furnishing6 = Furnishing.create(name:"Shoebox", room_id: 8)
furnishing6 = Furnishing.create(name:"Medicine Cabinet", room_id: 3)
furnishing7 = Furnishing.create(name:"Desk", room_id: 1)
furnishing8 = Furnishing.create(name:"Grandfather Clock", room_id: 5)
furnishing9 = Furnishing.create(name: "Spooky Coffin", room_id: 10)
furnishing10 = Furnishing.create(name: "Front Door", room_id: 9)

item1 = Item.create(name:"Gloves", grabbable_id: 7, grabbable_type:"Furnishing")
item2 = Item.create(name:"Mask", grabbable_id: 6, grabbable_type: "Furnishing")
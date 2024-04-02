extends Item

var chair_interactable = "res://Scenes/Interactables/chair.tscn"

func use():
	var chair_scene = load(chair_interactable)
	var instance = chair_scene.instantiate()
	instance.position = Globals.player.position
	Globals.interactables.add_child(instance)
	InventoryGlobal.remove_item("chair")
	

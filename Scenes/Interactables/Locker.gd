class_name Locker extends Interactable

@export var item: Item
@export var locker_name: String

func use():
	if (InventoryGlobal.has_item("paperclip")):
		Globals.minigames.start_timing_game(item)
		InventoryGlobal.remove_item("paperclip")
	else:
		Globals.player.think(locker_name + " ... Locked")

class_name Locker extends Interactable

@export var item: Item
@export var locker_name: String

var locked = true

func use():
	if (locked):
		if (InventoryGlobal.has_item("paperclip")):
			Globals.minigames.start_timing_game(item)
			InventoryGlobal.remove_item("paperclip")
			locked = false
		else:
			Globals.player.think(locker_name + " ... Locked")
	else:
		Globals.player.think("Empty...")

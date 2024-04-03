class_name Locker extends Interactable

@export var item: Item
@export var locker_name: String

var locked = true

func use():
	if (locked):
		if (InventoryGlobal.get_selected_item()):
			if (InventoryGlobal.get_selected_item().item_name == "paperclip"):
				Globals.minigames.start_timing_game(item)
				locked = false
				return
		Globals.player.think(locker_name + " ... Locked")
	else:
		Globals.player.think("Empty...")

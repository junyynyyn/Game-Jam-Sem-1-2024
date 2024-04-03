extends Interactable

func use():
	if (InventoryGlobal.get_selected_item()):
		if (InventoryGlobal.get_selected_item().item_name == "screwdriver"):
			Globals.minigames.start_powerbox()
			return
	Globals.player.think("I need a tool to open this with")
	

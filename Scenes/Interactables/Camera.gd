extends Interactable

var active = true
	
func use():
	if (active):
		if (InventoryGlobal.get_selected_item()):
			print(InventoryGlobal.get_selected_item().item_name)
			if (InventoryGlobal.get_selected_item().item_name == "gun" and InventoryGlobal.has_item("bullet")):
				active = false
				InventoryGlobal.remove_item("bullet")
				$PointLight2D.hide()
				return
				
		Globals.player.think("They’re watching my every move from this...I should get rid of it, but how?")

extends Item

func use():
	if (InventoryGlobal.has_item("bullet")):
		print("Bang!")
	else:
		print("No ammo...")

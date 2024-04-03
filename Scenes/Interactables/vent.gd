extends Interactable

var opened = false

func _process(delta):
	if (Globals.lasers_disabled and opened):
		$AnimatedSprite2D.play("full_disabled")
		$PointLight2D.hide()
	elif (Globals.lasers_disabled):
		$AnimatedSprite2D.play("laser_disabled")
		$PointLight2D.hide()
	elif (opened):
		$AnimatedSprite2D.play("cover_removed")
	else:
		$AnimatedSprite2D.play("default")

func use():
	if (InventoryGlobal.get_selected_item()):
		if (InventoryGlobal.get_selected_item().item_name == "screwdriver" and not opened):
			opened = true
			return
	if (not Globals.lasers_disabled and not opened):
		Globals.player.think("Seems like I’ll have to deactivate the lasers and remove the cover somehow.")
	elif (not Globals.lasers_disabled):
		Globals.player.think("I have to deactivate these lasers…maybe there’s a security system somewhere?")
	elif (not opened):
		Globals.player.think("I probably need something to unscrew these with…")
	else:
		if (Globals.camera_disabled):
			Globals.play_ending(0)
		else:
			Globals.play_ending(1)

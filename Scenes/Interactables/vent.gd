extends Interactable

var opened = false

func _process(delta):
	if (Globals.lasers_disabled and opened):
		$AnimatedSprite2D.play("full_disabled")
	elif (Globals.lasers_disabled):
		$AnimatedSprite2D.play("laser_disabled")
	elif (opened):
		$AnimatedSprite2D.play("cover_removed")
	else:
		$AnimatedSprite2D.play("default")

func use():
	if (InventoryGlobal.has_item("electric_screwdriver")):
		opened = true
		pass
	elif (not Globals.lasers_disabled and not opened):
		Globals.player.think("Seems like I’ll have to deactivate the lasers and remove the cover somehow.")
	elif (not Globals.lasers_disabled):
		Globals.player.think("I have to deactivate these lasers…maybe there’s a security system somewhere?")
	elif (not opened):
		Globals.player.think("I probably need something to unscrew these with…")
	else:
		print("Game Won!")

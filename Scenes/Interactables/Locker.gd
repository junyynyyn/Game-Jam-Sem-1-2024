class_name Locker extends Interactable

@export var item: Item
@export var locker_name: String

func use():
	Globals.player.think(locker_name + " ... Locked")

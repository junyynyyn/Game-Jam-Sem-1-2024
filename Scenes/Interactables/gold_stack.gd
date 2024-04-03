extends Interactable

@onready var gold = $Item

func use():
	Globals.player.think("Valuable... but not useful in this situation")

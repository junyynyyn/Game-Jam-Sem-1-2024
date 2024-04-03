extends Interactable



# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	pass # Replace with function body.

func use():
	Globals.player.think("Shame I don't have enough time to break this open!")

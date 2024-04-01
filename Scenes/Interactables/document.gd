extends Interactable

# Called when the node enters the scene tree for the first time.
func _ready():
	super()

func use():
	Globals.player.think("A list of keys")

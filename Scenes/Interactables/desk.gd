extends Interactable

var opened_desk

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	pass # Replace with function body.

func use():
	Globals.player.think("A desk... could be helpful to assemble something")

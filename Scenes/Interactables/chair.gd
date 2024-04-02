extends Interactable

@onready var chair_item = $Chair

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	pass

func use():
	InventoryGlobal.add_item(chair_item)
	queue_free()

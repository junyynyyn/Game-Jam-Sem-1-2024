extends Interactable

# Called when the node enters the scene tree for the first time.
func _ready():
	super()

func use():
	if InventoryGlobal.has_item("paperclip"):
		InventoryGlobal.remove_item("paperclip")
		print("Opened Lock?")
		queue_free()

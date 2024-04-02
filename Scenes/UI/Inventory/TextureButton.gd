extends TextureButton

@onready var itemSlot = $ItemSlot

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_item(item):
	itemSlot.set_item(item)
	
func display_item():
	itemSlot.display_item()

func _on_pressed():
	print("Test")

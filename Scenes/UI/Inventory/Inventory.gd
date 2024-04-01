extends Control

var slot_container

# Called when the node enters the scene tree for the first time.
func _ready():
	slot_container = $Slots

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func display_items():
	var items = InventoryGlobal.get_items()
	var slots = slot_container.get_children()
	# Clear slots
	for child in slots:
		child.set_item(null)
	# Add items back in
	for item_num in len(items):
		slots[item_num].set_item(items[item_num])
	# Run display code
	for child in slots:
		child.display_item()

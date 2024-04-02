extends Control

var slot_container

func _ready():
	slot_container = $Slots
	
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

func _on_texture_button_pressed():
	for num in len(slot_container.get_children()):
		if (slot_container.get_children()[num].button_pressed == true):
			InventoryGlobal.selected_slot = num
			break

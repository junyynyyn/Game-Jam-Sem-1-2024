extends Interactable

@onready var rope = $Item

func use():
	InventoryGlobal.add_item(rope)
	queue_free()

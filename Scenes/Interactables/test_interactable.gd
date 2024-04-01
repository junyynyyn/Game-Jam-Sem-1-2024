extends Interactable

var test_item

func _ready():
	super()
	test_item = $Item

func use():
	InventoryGlobal.add_item(test_item)

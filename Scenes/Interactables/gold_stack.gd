extends Interactable

@onready var gold = $Item

func use():
	InventoryGlobal.add_item(gold)

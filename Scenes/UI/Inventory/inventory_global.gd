extends Node

var max_capacity = 5
var selected_slot = 0

var itemList = []
var inventoryUI

func _ready():
	inventoryUI = get_tree().root.get_node("/root/Main/UI/InventoryUI")

func isFull(): 
	return len(itemList) >= 5
	
func add_item(item):
	if (not isFull()): 
		itemList.append(item)
		inventoryUI.display_items()
		return true
	else:
		return false

func get_items():
	return itemList

extends Node

var max_capacity = 5
var selected_slot = 0

var itemList = []
var inventoryUI

func _ready():
	inventoryUI = get_tree().root.get_node("/root/Main/UI/InventoryUI")

# Helper functions for inventory
func isFull(): 
	return len(itemList) >= 5
	
func add_item(item):
	if (not isFull()): 
		itemList.append(item)
		inventoryUI.display_items()
		return true
	else:
		return false

func has_item(item_name):
	for item in itemList:
		if (item.item_name == item_name):
			return true
	return false 

func get_items():
	return itemList

func remove_item(item_name):
	for num in len(itemList):
		if (itemList[num].item_name == item_name):
			itemList.remove_at(num)
			inventoryUI.display_items()
			break

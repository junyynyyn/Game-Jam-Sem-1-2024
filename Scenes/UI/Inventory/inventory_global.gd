extends Node

var max_capacity = 7
var selected_slot = 0

var itemList = []
var inventoryUI

# Helper functions for inventory
func isFull(): 
	return len(itemList) >= 5
	
func add_item(item):
	if (not isFull()): 
		if (item):
			var new_item = item.duplicate()
			
			itemList.append(new_item)
			inventoryUI.display_items()
			return true
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

func get_selected_item():
	if len(itemList) >= (selected_slot + 1):
		return itemList[selected_slot]
	else:
		return null
		
func use_selected_item():
	if (get_selected_item()):
		get_selected_item().use()
		inventoryUI.display_items()

func clear():
	itemList = []
	inventoryUI.display_items()

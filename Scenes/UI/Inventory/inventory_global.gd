extends Node

var max_capacity = 5
var selected_slot = 0

var itemList = []

func _ready():
	var oneItem = Item.new()
	oneItem.sprite = "icon.svg"
	add_item(oneItem)

func isFull(): 
	return len(itemList) >= 5
	
func add_item(item):
	if (not isFull()): 
		itemList.append(item)
		return true
	else:
		return false

func get_items():
	return itemList

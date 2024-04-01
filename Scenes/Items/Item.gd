class_name Item
extends Node

@export var item_name: String
@export var sprite: String

func _ready():
	pass

func use():
	pass

func delete():
	queue_free()
	
func get_sprite():
	return sprite

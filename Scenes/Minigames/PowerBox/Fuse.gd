extends Node2D
class_name Fuse

var status : bool = false # true = green, false = red
@export var fuse_green : CompressedTexture2D
@export var fuse_red : CompressedTexture2D
# To be set by power box
var x_index : int 
var y_index : int

signal switched(x_index, y_index)

@onready var sprite = $Sprite2D

#func _on_area_2d_input_event(viewport, event, shape_idx):
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		#switch_color()
		#switched.emit(x_index, y_index)
		##print("switching " + str(x_index) + ", " + str(y_index))


func _on_button_pressed():
	switch_color()
	switched.emit(x_index, y_index)
	$AudioStreamPlayer.play()

func switch_color():
	if status:
		status = false
		sprite.texture = load("res://assets/asesprite/fuse_red.png")
	else:
		status = true
		sprite.texture = load("res://assets/asesprite/fuse_green.png")

func set_color(s : bool): # To be set by power box
	status = s
	sprite.texture = load("res://assets/asesprite/fuse_green.png") if s else load("res://assets/asesprite/fuse_red.png")

func get_color() -> bool:
	return status

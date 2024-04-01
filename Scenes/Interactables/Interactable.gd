class_name Interactable
extends Area2D

# Base class for interactable structures
var usable = true
var interact_area: Area2D

func _ready():
	interact_area = self
	interact_area.connect('area_exited', _on_player_exit)
	$InteractPrompt.hide()

# Empty use class, fill in through subclasses
func use():
	pass

func set_usable(usability):
	usable = usability
	
func show_interact_area():
	$InteractPrompt.show()
	
func hide_interact_area():
	$InteractPrompt.hide()

func _on_player_exit(_area):
	$InteractPrompt.hide()

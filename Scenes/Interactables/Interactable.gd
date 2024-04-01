class_name Interactable
extends Node2D

# Base class for interactable structures

var usable = true
var player_in_range = false
var interact_area: Area2D

func _ready():
	interact_area = $InteractableArea


# Empty use class, fill in through subclasses
func use():
	pass

func set_usable(usability):
	usable = usability
	


class_name Interactable
extends Node2D

var usable = true
var player_in_range = false
var interact_area: Area2D

func _ready():
	interact_area = $InteractableArea
	
func _process(_delta):
	if (len(interact_area.get_overlapping_bodies()) > 0):
		if (interact_area.get_overlapping_bodies()[0].is_in_group("Player")):
			player_in_range = true
		else:
			player_in_range = false
	else:
		player_in_range = false
		
	if (Input.is_action_just_pressed("interact") and player_in_range and usable):
		use()
		
func use():
	pass

func set_usable(usability):
	usable = usability
	


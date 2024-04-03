extends Node

var player
var interactables
var main_scene
var info_ui
var minigames

var lasers_disabled = false
var camera_disabled = false

var ending_path = "res://Scenes/EndScreens/"
var endings = ["EscapeEnding", "EscapeNoCamera", "LockedInEnding"]

func reset():
	lasers_disabled = false
	camera_disabled = false

func play_ending(id):
	get_tree().change_scene_to_file(ending_path + endings[id] + ".tscn")

extends Node

var player
var interactables
var main_scene
var info_ui
var minigames

var lasers_disabled = false

func stop_game():
	get_tree().quit()

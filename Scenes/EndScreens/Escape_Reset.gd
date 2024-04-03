extends Control

var reload = "res://Scenes/main.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Input.is_action_just_pressed("reset")):
		Globals.reset()
		get_tree().change_scene_to_file(reload)

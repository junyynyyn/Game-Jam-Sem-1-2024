extends Control

var reload = "res://Scenes/main.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("reset")):
		get_tree().change_scene_to_file(reload)

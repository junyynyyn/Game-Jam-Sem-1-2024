extends Control

var timer = 120
var timer_label 

func _ready():
	timer_label = $Label
	
func _process(delta):
	timer -= delta
	timer_label.text = "%d:%d:%d" % [int(timer / 60), int(timer) % 60, int(timer * 100) % 100]
	if (timer <= 0):
		Globals.stop_game()

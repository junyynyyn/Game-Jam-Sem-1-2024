extends Control

var timer = 120
var timer_label 

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer -= delta
	timer_label.text = "%d:%d:%d" % [int(timer / 60), int(timer) % 60, int(timer * 100) % 100]

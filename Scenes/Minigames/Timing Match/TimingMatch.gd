extends Control

@onready var progress_bar = $TextureProgressBar
@onready var target_marker = $TargetMarker

@export var required_timings: int

signal completed

var timings_completed = 0
var progress_movement = 1
var SPEED = 5
var THRESHOLD = 10
var cooldown = false
var play = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	if (play):
		if (Input.is_action_just_pressed("interact") and (not cooldown)):
			var target_val = (target_marker.position.x / 2)
			if (progress_bar.value > target_val - THRESHOLD and progress_bar.value < target_val + THRESHOLD):
				get_tree().paused = false
				completed.emit()
				end()
			else:
				cooldown = true
				$CooldownTimer.start()

func _on_timer_timeout():
	if (progress_bar.value >= 100 or progress_bar.value <= 0):
		progress_movement *= -1
	progress_bar.value += progress_movement * SPEED

func _on_cooldown_timer_timeout():
	cooldown = false

func start():
	play = true
	target_marker.position.x = randi_range(20, 180)
	$Timer.start()
	
func end():
	play = false
	$Timer.stop()

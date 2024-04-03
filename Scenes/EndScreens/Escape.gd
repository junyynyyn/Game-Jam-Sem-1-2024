extends CharacterBody2D

@export var SPEED = 150

func _ready():
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	velocity.x = SPEED
	
	move_and_slide()

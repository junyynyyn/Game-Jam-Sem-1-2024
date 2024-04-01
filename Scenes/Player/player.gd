extends CharacterBody2D

@export var SPEED : float = 150.0
var interact_area

# Called when the node enters the scene tree for the first time.
func _ready():
	interact_area = $InteractArea
	Globals.player = self

# Just movement code atm
func _process(delta):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (Vector2(input_dir.x, input_dir.y)).normalized()
	
	velocity = direction * SPEED
	
	if (velocity.x > 0):
		$AnimatedSprite2D.play("right")
	elif (velocity.x < 0):
		$AnimatedSprite2D.play("left")
	if (velocity.y > 0):
		$AnimatedSprite2D.play("down")
	elif (velocity.y < 0):
		$AnimatedSprite2D.play("up")
	elif (velocity.x == 0 and velocity.y == 0):
		$AnimatedSprite2D.stop()
	
	# Code to interact with object
	if (len(interact_area.get_overlapping_areas()) > 0):
		var closest
		var closest_dist
		for area in interact_area.get_overlapping_areas():
			if area.is_in_group("Interactable"):
				area.hide_interact_area()
				if (not closest):
					closest = area
					closest_dist = abs(position - area.position)
				else:
					if (abs(position - area.position) < closest_dist):
						closest = area
						closest_dist =  abs(position - area.position)
		closest.show_interact_area()
		if (Input.is_action_just_pressed("interact")):
			closest.use()
	move_and_slide()

func get_distance(position):
	return self.position - position

func think(message):
	$ThoughtBubble/Label.text = message
	$ThoughtBubble.show()
	$ThoughtBubble/MessageTimer.start()

func _on_timer_timeout():
	$ThoughtBubble.hide()

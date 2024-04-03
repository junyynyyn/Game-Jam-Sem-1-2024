extends CharacterBody2D

@export var SPEED : float = 150.0
var interact_area
@onready var gun = $StarterItems/Gun
@onready var bullet = $StarterItems/Bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	interact_area = $InteractArea
	Globals.player = self
	InventoryGlobal.add_item(gun)
	InventoryGlobal.add_item(bullet)

# Just movement code atm
func _process(_delta):
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
					closest_dist = get_distance_from_mouse(area.global_position)
				else:
					if (get_distance_from_mouse(area.global_position) < closest_dist):
						closest = area
						closest_dist = get_distance_from_mouse(area.global_position)
		closest.show_interact_area()
		if (Input.is_action_just_pressed("interact")):
			if ($InteractCooldown.is_stopped()):
				closest.use()
				$InteractCooldown.start()
	
	# Using an object in inventory
	if (Input.is_action_just_pressed("use")):
		InventoryGlobal.use_selected_item()
		
	if (Input.is_action_just_pressed("reset")):
		InventoryGlobal.clear()
		Globals.reset()
		get_tree().reload_current_scene()
	
	move_and_slide()

func get_distance_from_mouse(target_position):
	return abs(get_global_mouse_position().distance_to(target_position))

func think(message):
	$ThoughtBubble/Label.text = message
	$ThoughtBubble.show()
	$ThoughtBubble/MessageTimer.start()

func _on_timer_timeout():
	$ThoughtBubble.hide()

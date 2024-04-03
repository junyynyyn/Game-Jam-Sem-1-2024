extends Node2D

signal powerbox_complete
signal powerbox_leave # If player decides to exit power box minigame early

@onready var winsize = get_viewport().size

const fuse = preload("res://Scenes/Minigames/PowerBox/fuse.tscn")
const NUM_FUSES = 9

# hacky fix, not bothered with proportions if we want to change window size
var start_x = 240
var start_y = 150
var pixels_apart = 100

var fuse_rows : Array

func _ready():
	# Initialize nine fuses
	for i in range(3):
		var row : Array[Fuse]
		
		for j in range(3):
			var new_fuse = fuse.instantiate()
			add_child(new_fuse)
			new_fuse.x_index = i
			new_fuse.y_index = j
			new_fuse.position = Vector2(
				start_x + (pixels_apart * (j-1)),
				start_y + (pixels_apart * (i-1))
			)
			new_fuse.switched.connect(Callable(self, "toggle_button"))
			
			# Initialize fuses in a default arrangement
			if i == 0:
				new_fuse.set_color(false)
			if i == 1:
				if j == 2:
					new_fuse.set_color(true)
				else:
					new_fuse.set_color(false)
			if i == 2:
				if j == 1:
					new_fuse.set_color(false)
				else:
					new_fuse.set_color(true)
			row.append(new_fuse)
		
		fuse_rows.append(row)

func _process(delta):
	pass

func toggle_button(x, y): # fuse at x and y already switched colors (see area input event in Fuse)
	var adjacent_indices = [[x-1, y], [x+1, y], [x, y-1], [x, y+1]]
	for pair in adjacent_indices:
		if 0 <= pair[0] and pair[0] < 3 and 0 <= pair[1] and pair[1] < 3:
			fuse_rows[pair[0]][pair[1]].switch_color()
	if is_completed():
		powerbox_complete.emit()
		#print("HERE")

func is_completed() -> bool:
	for i in fuse_rows:
		for j in i:
			if j.status == false:
				return false
	return true

# X button
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		powerbox_leave.emit()
		print_debug("here")

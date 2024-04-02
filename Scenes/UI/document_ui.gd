extends Control

@onready var paper_clip = $PaperClip

var can_exit = false

func _process(_delta):
	if (self.visible == true):
		if (Input.is_action_just_pressed("interact") and can_exit):
			self.visible = false
			can_exit = false

func _on_texture_button_pressed():
	$TextureButton.hide()
	InventoryGlobal.add_item(paper_clip)

func _on_timer_timeout():
	can_exit = true

func start_timer():
	$Timer.start()

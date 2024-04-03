extends Control

var item_reward

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.minigames = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func start_timing_game(item):
	self.item_reward = item
	$TimingMatch.show()
	$TimingMatch.start()
	get_tree().paused = true
	
func hide_timing_game():
	$TimingMatch.hide()

func _on_timing_match_completed():
	hide_timing_game()
	InventoryGlobal.add_item(item_reward)
	
func start_powerbox():
	$PowerBox.show()

func hide_powerbox_game():
	$PowerBox.hide()
	
func _on_power_box_powerbox_complete():
	hide_powerbox_game()
	Globals.lasers_disabled = true

func _on_power_box_powerbox_leave():
	hide_powerbox_game()

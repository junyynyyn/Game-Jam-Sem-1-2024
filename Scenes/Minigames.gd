extends Control

var item_reward

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.minigames = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	

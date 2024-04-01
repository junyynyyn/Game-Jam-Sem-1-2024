extends TextureRect

var item

# Called when the node enters the scene tree for the first time.
func _ready():
	display_item()

func set_item(item):
	self.item = item

func display_item():
	if (item):
		texture = load(item.get_sprite())

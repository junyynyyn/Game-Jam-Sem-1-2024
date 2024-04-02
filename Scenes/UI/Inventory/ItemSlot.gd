extends TextureRect

var item

func _ready():
	pass

func set_item(new_item):
	self.item = new_item

func display_item():
	if (item):
		texture = load(item.get_sprite())
	else:
		texture = null

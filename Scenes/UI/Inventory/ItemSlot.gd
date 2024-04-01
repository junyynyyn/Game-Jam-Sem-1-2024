extends TextureRect

var item

func _ready():
	pass

func set_item(item):
	self.item = item

func display_item():
	if (item):
		texture = load(item.get_sprite())
	else:
		texture = load("res://assets/kenney_roguelike-modern-city/Tiles/tile_0000.png")

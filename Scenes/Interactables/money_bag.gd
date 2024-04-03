extends Interactable

var sprites = [
	"res://assets/asesprite/money_bag_1_128.png",
	"res://assets/asesprite/money_bag_2_128.png"
]

func _ready():
	super()
	$Sprite2D.texture = load(sprites.pick_random())

func use():
	Globals.player.think("These are filled with cash… this one looks big enough to fit even me!")

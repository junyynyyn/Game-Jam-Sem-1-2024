extends Interactable

var sprites = [
	"res://assets/asesprite/money_bag_1_128.png",
	"res://assets/asesprite/money_bag_2_128.png"
]

func _ready():
	$Sprite2D.texture = load(sprites.pick_random())

func use():
	print("Moneyy bag")

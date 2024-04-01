extends Interactable

@export var item: Item
@export var locker_name: String

func _ready():
	super()
	pass
	
func use():
	print("Locker")

extends Interactable

# Called when the node enters the scene tree for the first time.
func _ready():
	super()

func use():
	Globals.info_ui.show_document_ui()

func _on_readable_area_body_exited(body):
	if (body.is_in_group("Player")):
		Globals.info_ui.hide_document_ui()

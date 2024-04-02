extends Control

func _ready():
	Globals.info_ui = self

func show_document_ui():
	$Document_UI.show()
	$Document_UI.start_timer()

func hide_document_ui():
	$Document_UI.hide()
	$Document_UI.can_exit = false

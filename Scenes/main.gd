extends Node2D

func _ready():
	Globals.main_scene = self
	Globals.interactables = $Interactables
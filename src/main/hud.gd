class_name Hud extends Node

@onready var hud_canvas_layer: CanvasLayer = $HudCanvasLayer

func _ready():
	ScenesManager.hud = self


func add_info(label: Label):
	hud_canvas_layer.add_child(label)
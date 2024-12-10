class_name Hud extends Node

@onready var hud_canvas_layer: CanvasLayer = $HudCanvasLayer
@onready var timer: Timer = $Timer
@onready var time_label: Label = $CanvasLayer/TimeLabel

func _ready():
	ScenesManager.hud = self

func _process(delta):
	time_label.text = str(seconds_to_mm_ss(int(timer.time_left)))

func add_info(label: Label):
	hud_canvas_layer.add_child(label)

func clear_texts():
	for child in hud_canvas_layer.get_children():
		child.queue_free()

func seconds_to_mm_ss(seconds: int) -> String:
	var minutes = seconds / 60  # Get the number of whole minutes
	var remaining_seconds = seconds % 60  # Get the remaining seconds
	return "%02d:%02d" % [minutes, remaining_seconds]  # Format as MM:SS

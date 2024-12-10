class_name StartMinigame extends Control

signal finished(win:bool)

@onready var button = $VBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func button_pressed():
	finished.emit(true)
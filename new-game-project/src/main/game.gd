extends Node

@onready var trigger1 = $Map/MinigameTrigger
var minigame: int = 0

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_minigame_trigger_minigame_triggered(minigame_number: Variant) -> void:
	minigame = minigame_number
	print(minigame)

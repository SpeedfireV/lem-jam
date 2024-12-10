extends Button

@onready var main_scene: PackedScene = preload("res://src/main/game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed():
	get_tree().change_scene_to_packed(main_scene)

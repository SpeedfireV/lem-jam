class_name MinigameTrigger extends Area2D

var minigame1: PackedScene = preload("res://src/main/minigame.tscn")
var is_player_inside: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("enter_game") and is_player_inside:
		launch_minigame()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		is_player_inside = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		is_player_inside = false
	
func launch_minigame():
	var new_minigame: Minigame = minigame1.instantiate()
	ScenesManager.minigames_node.add_child(new_minigame)

#func clear_minigames():
	#var minigames_node: Node = get_tree().root.get_node("Minigames")
	#
	#for child in minigames_node.get_children():
		#child.queue_free()

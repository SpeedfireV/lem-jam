class_name MinigamesNode extends Node


func _ready():
	ScenesManager.minigames_node = self

func set_minigame(minigame: MinigameViewTemplate):
	if len(get_children()) <= 0:
		add_child(minigame)

func clear_minigames():
	for child in get_children():
		child.queue_free()

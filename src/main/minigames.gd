extends Node


func _ready():
	ScenesManager.minigames_node = self

func set_minigame(minigame: MinigameViewTemplate):
	if len(get_children()) <= 0:
		add_child(minigame)
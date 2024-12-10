extends MinigameViewTemplate

@onready var hex_minigame_node = $BackgroundTextureRect/MarginContainer/Mingame/HexButtonsMinigame

func _ready():
	super._ready()
	hex_minigame_node.finished.connect(minigame_finished)

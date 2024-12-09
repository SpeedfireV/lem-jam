extends MinigameViewTemplate

@onready var hex_minigame_node = $BackgroundTextureRect/MarginContainer/Mingame/HexButtonsMinigame

func _ready():
	super._ready()
	hex_minigame_node.finished.connect(minigame_finished)

func win(): # Nadpisuje bazową wygraną
	ScenesManager.minigames_node.clear_minigames()
	# TODO: Ogarnąć zapis zrobionych minigier

func lose(): # Nadpisuje bazową przegraną
	ScenesManager.minigames_node.clear_minigames()

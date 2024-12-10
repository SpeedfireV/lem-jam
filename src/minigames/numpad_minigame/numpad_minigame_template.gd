extends MinigameViewTemplate

@onready var numpad_minigame = $BackgroundTextureRect/MarginContainer/Mingame/numpad_minigame

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	numpad_minigame.finished.connect(minigame_finished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

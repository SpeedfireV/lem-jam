extends MinigameViewTemplate

@onready var minigame = $BackgroundTextureRect/MarginContainer/Mingame/EndMinigame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	minigame.finished.connect(minigame_finished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
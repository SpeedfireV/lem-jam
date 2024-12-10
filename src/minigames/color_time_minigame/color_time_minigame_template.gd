extends MinigameViewTemplate

@onready var minigame = $BackgroundTextureRect/MarginContainer/Mingame/ColorTimeMinigame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	minigame.finished.connect(minigame_finished)
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)

func win():
	super.win()

func lose():
	super.lose()
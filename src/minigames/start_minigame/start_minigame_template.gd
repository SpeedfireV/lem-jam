extends MinigameViewTemplate



@onready var minigame = $BackgroundTextureRect/MarginContainer/Mingame/StartMinigame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	minigame.finished.connect(minigame_finished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func win():
	super.win()
	ScenesManager.map.open_door0()

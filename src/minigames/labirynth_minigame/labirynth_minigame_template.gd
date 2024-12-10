extends MinigameViewTemplate


@onready var labirynth_minigame = $BackgroundTextureRect/MarginContainer/Mingame/labirynth_minigame

func _ready():
	super._ready()
	labirynth_minigame.finished.connect(minigame_finished)

func win():
	$BackgroundTextureRect/Label.visible = false
	$BackgroundTextureRect/AnimationPlayer.play("new_animation")
	$BackgroundTextureRect/Label.visible = true
	exit_minigame()

func lose():
	pass

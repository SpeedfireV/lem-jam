class_name MinigameViewTemplate extends CanvasLayer

signal finished(winned: bool)

@onready var exit_button: Button = $BackgroundTextureRect/MarginContainer/ExitButton
@onready var minigame_node: Node = $BackgroundTextureRect/MarginContainer/Mingame
@export var minigame_view: PackedScene # MUSISZ DODAĆ NA STARCIE MINIGAME_VIEW - TO JEST WŁAŚCIWA MINIGIERKA

func _ready():
	$BackgroundTextureRect/Label.visible = false
	exit_button.pressed.connect(exit_minigame)
	set_minigame()

func _process(delta):
	pass

func exit_minigame(arg = null):
	queue_free()

func set_minigame():
	if minigame_view != null and len(minigame_node.get_children()) <= 0:
		var new_minigame = minigame_view.instantiate()
		minigame_node.add_child(new_minigame)

func minigame_finished(winned: bool):
	if winned:
		win()
	else:
		lose()

func win():
	$Win_sound.play()
	$BackgroundTextureRect/Label.visible = false
	$BackgroundTextureRect/AnimationPlayer.play("new_animation")
	$BackgroundTextureRect/Label.visible = true
	$BackgroundTextureRect/AnimationPlayer.animation_finished.connect(exit_minigame)
	finished.emit(true)

func lose():
	$Lose_sound.play()
	pass

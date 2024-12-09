class_name MinigameViewTemplate extends CanvasLayer


@onready var exit_button: Button = $BackgroundTextureRect/MarginContainer/ExitButton
@onready var minigame_node: Node = $BackgroundTextureRect/MarginContainer/Mingame
@export var minigame_view: PackedScene # MUSISZ DODAĆ NA STARCIE MINIGAME_VIEW - TO JEST WŁAŚCIWA MINIGIERKA

func _ready():
	exit_button.pressed.connect(exit_minigame)
	set_minigame()

func _process(delta):
	print(exit_button)

func exit_minigame():
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
	pass

func lose():
	pass
extends CanvasLayer


@onready var exit_button: Button = $BackgroundTextureRect/MarginContainer/ExitButton
@onready var minigame_node: Node = $BackgroundTextureRect/MarginContainer/Mingame
var minigame_view # MUSISZ DODAĆ NA STARCIE MINIGAME_VIEW - TO JEST WŁAŚCIWA MINIGIERKA

func _ready():
	exit_button.pressed.connect(exit_minigame)
	set_minigame()

func _process(delta):
	print(exit_button)

func exit_minigame():
	queue_free()

func set_minigame():
	minigame_node.add_child(minigame_view)

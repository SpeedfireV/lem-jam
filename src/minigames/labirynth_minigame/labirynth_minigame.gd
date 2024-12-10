class_name LabirynthMinigame extends Control


var current_position = Vector2(1, 1)

@onready var button_up: Button = $HBoxContainer/GridContainer/ButtonUp
@onready var button_left: Button = $HBoxContainer/GridContainer/ButtonLeft
@onready var button_right: Button = $HBoxContainer/GridContainer/ButtonRight
@onready var button_down: Button = $HBoxContainer/GridContainer/ButtonDown

@onready var cells_grid_container: GridContainer = $HBoxContainer/MarginContainer/Cells

func _ready():
	button_up.pressed.connect(move_up)
	button_left.pressed.connect(move_left)
	button_right.pressed.connect(move_right)
	button_down.pressed.connect(move_down)

func _process(delta):
	var cells: Array = cells_grid_container.get_children()
	for i in range(256):
		var stylebox: StyleBoxFlat = cells[i].get_theme_stylebox("panel")
		var currently_checked_pos: Vector2 = Vector2(i / 16, i % 16)
		print(currently_checked_pos)
		if current_position == currently_checked_pos:
			stylebox.bg_color = Color.RED
		else:
			stylebox.bg_color = Color.GRAY
		cells[i].add_theme_stylebox_override("panel", stylebox)
			
		


func move_up():
	pass

func move_left():
	pass

func move_right():
	pass

func move_down():
	pass
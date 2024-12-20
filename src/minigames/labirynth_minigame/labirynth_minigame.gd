class_name LabirynthMinigame extends Control

signal finished(win: bool)

var current_position: Vector2

@onready var light1: Panel = $HBoxContainer/VBoxContainer/LightsContainer/Panel
@onready var light2: Panel = $HBoxContainer/VBoxContainer/LightsContainer/Panel2
@onready var light3: Panel = $HBoxContainer/VBoxContainer/LightsContainer/Panel3
@onready var light_on_texture = preload("res://assets/graphics/objects/light_on.png")

@onready var button_up: Button = $HBoxContainer/GridContainer/ButtonUp
@onready var button_left: Button = $HBoxContainer/GridContainer/ButtonLeft
@onready var button_right: Button = $HBoxContainer/GridContainer/ButtonRight
@onready var button_down: Button = $HBoxContainer/GridContainer/ButtonDown

@onready var cells_grid_container: GridContainer = $HBoxContainer/VBoxContainer/MarginContainer/Cells

var turned_on_light: int = randi_range(0, 2)

var directions: Dictionary = {
	0: [
		Vector2(0, 0), Vector2(1, 0), Vector2(1,1), Vector2(4, 1), Vector2(4, 4), Vector2(8, 4), Vector2(8, 5), Vector2(11, 5), Vector2(11, 12), Vector2(15, 12), Vector2(15, 14)
	],
	1: [
		Vector2(15, 0), Vector2(15, 1), Vector2(12, 1), Vector2(12, 3), Vector2(7, 3), Vector2(7, 5), Vector2(8, 5), Vector2(8, 6), Vector2(9, 6), Vector2(9, 9), Vector2(13, 9), Vector2(13, 11), Vector2(9, 11), Vector2(9, 15), Vector2(15, 15)
	],
	2: [
		Vector2(15, 15), Vector2(14, 15), Vector2(14, 12), Vector2(11, 12), Vector2(11, 8), Vector2(9, 8), Vector2(9, 15), Vector2(6, 15), Vector2(6, 10), Vector2(4, 10), Vector2(4, 13), Vector2(3, 13), Vector2(3, 14), Vector2(2, 14), Vector2(2, 15), Vector2(0, 15)
	]
}

func turn_on_light():
	var stylebox_on: StyleBoxTexture = StyleBoxTexture.new()
	stylebox_on.texture = light_on_texture
	if turned_on_light == 0:
		light1.add_theme_stylebox_override("panel", stylebox_on)
	elif turned_on_light == 1:
		light2.add_theme_stylebox_override("panel", stylebox_on)
	else:
		light3.add_theme_stylebox_override("panel", stylebox_on)

func _ready():
	turn_on_light()
	current_position = directions[turned_on_light][0]
	button_up.pressed.connect(move_up)
	button_left.pressed.connect(move_left)
	button_right.pressed.connect(move_right)
	button_down.pressed.connect(move_down)

func _process(delta):
	var cells: Array = cells_grid_container.get_children()
	for i in range(256):
		var stylebox: StyleBoxFlat = cells[i].get_theme_stylebox("panel")
		var currently_checked_pos: Vector2 = Vector2(i % 16, i / 16)
		if current_position == currently_checked_pos:
			stylebox.bg_color = Color.RED
		else:
			stylebox.bg_color = Color.GRAY
		cells[i].add_theme_stylebox_override("panel", stylebox)

		
		
func check_if_correct():
	var is_correct: bool = false
	for i in range(len(directions[turned_on_light]) - 1):
		is_correct = check_if_between(directions[turned_on_light][i], directions[turned_on_light][i + 1])
		if is_correct:
			break
	if not is_correct:
		$Error_sound.play()
		finished.emit(false)
	if current_position == directions[turned_on_light][len(directions[turned_on_light]) - 1]:
		finished.emit(true)

func check_if_between(vector1: Vector2, vector2: Vector2) -> bool:
	if vector1.x == vector2.x and vector2.x == current_position.x:
		return min(vector1.y, vector2.y) <= current_position.y and current_position.y <= max(vector1.y, vector2.y)
	elif vector1.y == vector2.y and vector2.y == current_position.y:
		return min(vector1.x, vector2.x) <= current_position.x and current_position.x  <= max(vector1.x, vector2.x)
	else:
		return false


func move_up():
	if current_position.y > 0:
		current_position += Vector2(0, -1)
	check_if_correct()

func move_left():
	if current_position.x > 0:
		current_position += Vector2(-1, 0)
	check_if_correct()

func move_right():
	if current_position.x < 15:
		current_position += Vector2(1, 0)
	check_if_correct()

func move_down():
	if current_position.y < 15:
		current_position += Vector2(0, 1)
	check_if_correct()

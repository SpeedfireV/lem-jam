class_name HexButtonsMinigame extends Control


signal finished(win: bool)

var buttons: Array[Button] = []

var texture_buttons: Array = [
	preload("res://assets/graphics/objects/hex_game_buttons/button_1.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_2.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_3.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_4.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_5.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_6.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_7.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_8.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_9.png")
]

var texture_buttons_pressed: Array = [
	preload("res://assets/graphics/objects/hex_game_buttons/button_1_pressed.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_2_pressed.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_3_pressed.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_4_pressed.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_5_pressed.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_6_pressed.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_7_pressed.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_8_pressed.png"),
	preload("res://assets/graphics/objects/hex_game_buttons/button_9_pressed.png")
]

@onready var red_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button1
@onready var blue_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button2
@onready var green_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button3
@onready var yellow_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button4
@onready var orange_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button5
@onready var purple_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button6
@onready var pink_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button7
@onready var turquse_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button8
@onready var aqua_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button9

@onready var answer_label: Label = $VBoxContainer/AnswerLabel
@onready var accept_button: Button = $VBoxContainer/HBoxContainer/VBoxContainer/AcceptButton
@onready var cancel_button: Button = $VBoxContainer/HBoxContainer/VBoxContainer/CancelButton

var entered_sequence: Array[int] = []



var configurations: Dictionary = {
	"123" : [2,2,3,4,5,6],
	"132" : [6,7,8,2,1,4],
	"213" : [3,4,5,6,7,2],
	"231" : [0,2,1,5,2,7],
	"312" : [8,7,2,4,5,0],
	"321" : [5,4,3,2,6,8]
}

var selected_configuration = configurations.keys().pick_random()

func _ready():
	buttons.append(red_button)
	buttons.append(blue_button)
	buttons.append(green_button)
	buttons.append(yellow_button)
	buttons.append(orange_button)
	buttons.append(purple_button)
	buttons.append(pink_button)
	buttons.append(turquse_button)
	buttons.append(aqua_button)
	for i in range(3):
		var row: int = int(selected_configuration[i])
		for j in range(3):
			var normal_stylebox: StyleBoxTexture = StyleBoxTexture.new()
			var pressed_stylebox: StyleBoxTexture = StyleBoxTexture.new()
			var hover_stylebox: StyleBoxTexture = StyleBoxTexture.new()
			normal_stylebox.texture = texture_buttons[(row-1) * 3 + j]
			hover_stylebox.texture = texture_buttons[(row-1) * 3 + j]
			pressed_stylebox.texture = texture_buttons_pressed[(row-1) * 3 + j]

			buttons[i * 3 + j].add_theme_stylebox_override("normal", normal_stylebox)
			buttons[i * 3 + j].add_theme_stylebox_override("pressed", pressed_stylebox)
			buttons[i * 3 + j].add_theme_stylebox_override("hover", hover_stylebox)
	for i in range(len(buttons)):
		buttons[i].pressed.connect(on_button_pressed.bind(i))

	accept_button.pressed.connect(check_sequence)
	cancel_button.pressed.connect(cancel_last_move)

func _process(delta):
	if len(entered_sequence) == 6:
		accept_button.disabled = false
	else:
		accept_button.disabled = true
	answer_label.text = ""
	for i in range(len(entered_sequence)):
		answer_label.text += "X"

func on_button_pressed(number: int):
	if len(entered_sequence) < 6:
		$Button_press_sound.play()
		entered_sequence.append(number)
	else:
		$Error_sound.play()
		pass # DODAĆ ERROR DŹWIĘK!!!
	

func cancel_last_move():
	$Button_press_sound.play()
	entered_sequence.pop_back()


func check_sequence():
	if entered_sequence == configurations[selected_configuration]:
		finished.emit(true)
	else:
		finished.emit(false)

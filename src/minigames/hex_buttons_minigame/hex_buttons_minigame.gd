class_name HexButtonsMinigame extends Control


var buttons: Array[Button] = []

var colors: Array[Color] = [Color(0xff0000ff), Color(0x0000ffff), Color(0x00ff00ff), Color(0xffff00ff), Color(0xffa500ff), Color(0x800080ff), Color(0xff69b4ff), Color(0x40e090ff), Color(0x87ceebff)]

@onready var red_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button1
@onready var blue_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button2
@onready var green_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button3
@onready var yellow_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button4
@onready var orange_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button5
@onready var purple_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button6
@onready var pink_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button7
@onready var turquse_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button8
@onready var aqua_button: Button = $VBoxContainer/HBoxContainer/GridContainer/Button9

@onready var answer_label = $VBoxContainer/AnswerLabel


var answer: String = ""


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

	for i in range(len(buttons)):
		var normal_stylebox: StyleBoxFlat = StyleBoxFlat.new()

		normal_stylebox.bg_color = colors[i]
		print(colors[i])

		buttons[i].add_theme_stylebox_override("normal", normal_stylebox)

	answer_label.text = answer


func on_button_pressed(number: int):
	pass

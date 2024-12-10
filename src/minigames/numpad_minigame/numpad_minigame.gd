extends Node

signal finished(win: bool)

@onready var wire1_texture: TextureRect = $VBoxContainer/HBoxContainer/VBoxContainer2/Wire1
@onready var wire2_texture: TextureRect = $VBoxContainer/HBoxContainer/VBoxContainer2/Wire2
@onready var wire3_texture: TextureRect = $VBoxContainer/HBoxContainer/VBoxContainer2/Wire3

@onready var wire1_normal: CompressedTexture2D = preload("res://assets/graphics/objects/wires/wire1.png")
@onready var wire2_normal: CompressedTexture2D = preload("res://assets/graphics/objects/wires/wire2.png")
@onready var wire3_normal: CompressedTexture2D = preload("res://assets/graphics/objects/wires/wire3.png")
@onready var wire1_cut: CompressedTexture2D = preload("res://assets/graphics/objects/wires/wire1_cut.png")
@onready var wire2_cut: CompressedTexture2D = preload("res://assets/graphics/objects/wires/wire2_cut.png")
@onready var wire3_cut: CompressedTexture2D = preload("res://assets/graphics/objects/wires/wire3_cut.png")

@onready var input_label: Label = $VBoxContainer/InputLabel

@onready var button0: Button = $VBoxContainer/HBoxContainer/GridContainer/Button0
@onready var button1: Button = $VBoxContainer/HBoxContainer/GridContainer/Button1
@onready var button2: Button = $VBoxContainer/HBoxContainer/GridContainer/Button2
@onready var button3: Button = $VBoxContainer/HBoxContainer/GridContainer/Button3
@onready var button4: Button = $VBoxContainer/HBoxContainer/GridContainer/Button4
@onready var button5: Button = $VBoxContainer/HBoxContainer/GridContainer/Button5
@onready var button6: Button = $VBoxContainer/HBoxContainer/GridContainer/Button6
@onready var button7: Button = $VBoxContainer/HBoxContainer/GridContainer/Button7
@onready var button8: Button = $VBoxContainer/HBoxContainer/GridContainer/Button8
@onready var button9: Button = $VBoxContainer/HBoxContainer/GridContainer/Button9

@onready var cancel_button: Button = $VBoxContainer/HBoxContainer/GridContainer/ButtonCancel
@onready var accept_button: Button = $VBoxContainer/HBoxContainer/GridContainer/ButtonAccept

@onready var code_label: Label = $VBoxContainer/HBoxContainer/VBoxContainer/Stickynote/CodeLabel

var buttons: Array[Button] = []

var wire1: bool = true
var wire2: bool = true
var wire3: bool = true
var default_code: String = "#123-456-789"
var code: String = default_code
var expected_code: String = ""
var input_code: String = ""
var entered_code: String = ""
var num2_dict: Dictionary = {
	"0": "1",
	"1": "2",
	"2": "4",
	"3": "4",
	"4": "6",
	"5": "6",
	"6": "8",
	"7": "8",
	"8": "10",
	"9": "10",
}
var num3_dict: Dictionary = {
	"0": "8",
	"1": "7",
	"2": "3",
	"3": "2",
	"4": "0",
	"5": "1",
	"6": "4",
	"7": "6",
	"8": "5",
	"9": "9",
}

func get_num_a(num: String):
	var new_num = str(int(num[0]) + int(num[1]) + int(num[0]))
	while len(new_num) < 3:
		new_num = "0" + new_num
	return new_num

func get_num_b(num: String):
	return num2_dict[num[0]] + num2_dict[num[1]] + num2_dict[num[2]]

func get_num_c(num: String):
	return num3_dict[num[0]] + num3_dict[num[1]] + num3_dict[num[2]]


# if wire{number} = false, wire is cut
func calc_expected_code():
	var code1 = code[1] + code[2] + code[3]
	var code2 = code[5] + code[6] + code[7]
	var code3 = code[9] + code[10] + code[11]
	if wire1 and wire2 and wire3:
		expected_code = get_num_c(code1) + get_num_c(code2) + get_num_c(code3)
	elif wire1 and wire2 and not wire3:
		expected_code = get_num_b(code1) + get_num_c(code2) + get_num_a(code3)
	elif wire1 and not wire2 and wire3:
		expected_code = get_num_b(code1) + get_num_a(code2) + get_num_c(code3)
	elif wire1 and not wire2 and not wire3:
		expected_code = get_num_b(code1) + get_num_a(code2) + get_num_a(code3)
	elif not wire1 and wire2 and wire3:
		expected_code = get_num_a(code1) + get_num_b(code2) + get_num_c(code3)
	elif not wire1 and wire2 and not wire3:
		expected_code = get_num_a(code1) + get_num_b(code2) + get_num_a(code3)
	elif not wire1 and not wire2 and wire3:
		expected_code = get_num_a(code1) + get_num_a(code2) + get_num_b(code3)
	elif not wire1 and not wire2 and not wire3:
		expected_code = get_num_a(code1) + get_num_a(code2) + get_num_a(code3)

func generate_code_wires():
	wire1 = true
	wire2 = true
	wire3 = true
	var num1 = 100 + randi() % 900
	var num2 = 100 + randi() % 900
	var num3 = 100 + randi() % 900
	code = "#" + str(num1) + "-" + str(num2) + "-" + str(num3)
	if randi() % 2 == 0:
		wire1 = false
	if randi() % 2 == 0:
		wire2 = false
	if randi() % 2 == 0:
		wire3 = false
	set_wire_texture()

func set_wire_texture():
	if wire1 == true:
		wire1_texture.texture = wire1_normal
	else:
		wire1_texture.texture = wire1_cut
	if wire2 == true:
		wire2_texture.texture = wire2_normal
	else:
		wire2_texture.texture = wire2_cut
	if wire3 == true:
		wire3_texture.texture = wire3_normal
	else:
		wire3_texture.texture = wire3_cut

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	seed(Time.get_unix_time_from_system())
	generate_code_wires()
	code_label.text = code
	buttons.append(button0)
	buttons.append(button1)
	buttons.append(button2)
	buttons.append(button3)
	buttons.append(button4)
	buttons.append(button5)
	buttons.append(button6)
	buttons.append(button7)
	buttons.append(button8)
	buttons.append(button9)
	for i in len(buttons):
		buttons[i].pressed.connect(_on_number_button_pressed.bind(i))
	accept_button.pressed.connect(_on_accept_button_pressed)
	cancel_button.pressed.connect(_on_cancel_button_pressed)
	calc_expected_code()
	print(expected_code)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	input_label.text = entered_code

func _on_number_button_pressed(number: int):
	entered_code += str(number)

func _on_cancel_button_pressed():
	entered_code = entered_code.substr(0, len(entered_code) - 1)

func _on_accept_button_pressed():
	if entered_code == expected_code:
		finished.emit(true)
	else:
		finished.emit(false)

extends Node

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

func get_num_b(num: String):
	return num2_dict[num[0]] + num2_dict[num[1]] + num2_dict[num[2]]

func get_num_c(num: String):
	return num3_dict[num[0]] + num3_dict[num[1]] + num3_dict[num[2]]


# if wire{number} = false, wire is cut
func calc_expected_code(wire1, wire2, wire3):
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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	code_label.text = default_code
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


	calc_expected_code(true, true, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	input_label.text = entered_code

func _on_number_button_pressed(number: int):
	entered_code += str(number)

func _on_cancel_button_pressed():
	entered_code = entered_code.substr(0, len(entered_code) - 1)

func _on_accept_button_pressed():
	pass
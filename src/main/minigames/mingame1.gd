extends Node

var default_code: String = "#123-456-789"
var code: String = default_code
var expected_code: String = ""
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
	calc_expected_code(true, true, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

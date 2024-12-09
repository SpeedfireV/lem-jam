extends Node

var default_code: String = "123456789"
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

func calc_expected_code(wire):
	var num1 = default_code[0] + default_code[1] + default_code[2]
	while len(num1) < 3:
		num1 = "0" + num1
	var num2 = num2_dict[default_code[3]] + num2_dict[default_code[4]] + num2_dict[default_code[5]]
	var num3 = num3_dict[default_code[6]] + num3_dict[default_code[7]] + num3_dict[default_code[8]]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	calc_expected_code(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

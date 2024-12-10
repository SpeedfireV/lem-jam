class_name ColorTimeMinigame extends Control

@onready var main_light: Panel = $HBoxContainer2/Panel
@onready var lights: Array = $HBoxContainer2/VBoxContainer/HBoxContainer.get_children()
@onready var button = $HBoxContainer2/VBoxContainer/Button
@onready var time_label = $HBoxContainer2/VBoxContainer2/TimeLabel
@onready var time_left_label = $HBoxContainer2/VBoxContainer2/TimeLeftLabel
@onready var timer = $Timer

var colors: Array[Color] = [Color.RED, Color.GREEN, Color.BLUE]

var times_pressed: int = 0
var time_started: int
var selected_color: Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var stylebox: StyleBoxFlat = StyleBoxFlat.new()
	stylebox.bg_color = colors.pick_random()
	main_light.add_theme_stylebox_override("panel", stylebox)
	time_label.text = "STARTED AT:\n" + str(int(int(ScenesManager.hud.timer.time_left) % 60)) + " SECONDS"
	button.pressed.connect(_on_button_pressed)
	timer.timeout.connect(_on_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_left_label.text = "TIME LEFT:\n" + str(ScenesManager.hud.seconds_to_mm_ss(int(timer.time_left)))


func _on_button_pressed():
	times_pressed += 1

func _on_timer_timeout():
	if true:
		pass
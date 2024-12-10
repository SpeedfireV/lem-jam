class_name ColorTimeMinigame extends Control

signal finished(win:bool)

@onready var main_light: Panel = $HBoxContainer2/Panel
@onready var lights: Array = $HBoxContainer2/VBoxContainer/HBoxContainer.get_children()
@onready var button = $HBoxContainer2/VBoxContainer/Button
@onready var time_label = $HBoxContainer2/VBoxContainer2/TimeLabel
@onready var time_left_label = $HBoxContainer2/VBoxContainer2/TimeLeftLabel
@onready var times_clicked_label: Label = $HBoxContainer2/VBoxContainer2/TimesClickedLabel
@onready var timer = $Timer

var colors: Array[Color] = [Color.RED, Color.GREEN, Color.BLUE]

var times_pressed: int = 0
var time_started: int
var selected_color: Color

var level: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var stylebox: StyleBoxFlat = StyleBoxFlat.new()
	selected_color = colors.pick_random()
	stylebox.bg_color = selected_color
	main_light.add_theme_stylebox_override("panel", stylebox)
	time_started = int(ScenesManager.hud.timer.time_left) % 60
	time_label.text = "STARTED AT:\n" + str(int(int(ScenesManager.hud.timer.time_left) % 60)) + " SECONDS"
	button.pressed.connect(_on_button_pressed)
	timer.timeout.connect(_on_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_left_label.text = "TIME LEFT:\n" + str(ScenesManager.hud.seconds_to_mm_ss(int(timer.time_left)))
	var stylebox: StyleBoxFlat = StyleBoxFlat.new()
	stylebox.bg_color = Color.GREEN
	for i in range(len(lights)):
		if i < level:
			lights[i].add_theme_stylebox_override("panel", stylebox)
	times_clicked_label.text = "YOU CLICKED\n" + str(times_pressed) + " TIMES"

		


func _on_button_pressed():
	times_pressed += 1

func _on_timer_timeout():
	var previous_level = level
	if selected_color == Color.RED:
		if time_started % 2 == 0 and times_pressed == 1:
			level += 1
		elif time_started % 2 == 1 and times_pressed == 2:
			level += 1
	elif selected_color == Color.GREEN:
		if time_started % 2 == 0 and times_pressed == 2:
			level += 1
		elif time_started % 2 == 1 and times_pressed == 4:
			level += 1
	elif selected_color == Color.BLUE:
		if time_started % 2 == 0 and times_pressed == 3:
			level += 1
		elif time_started % 2 == 1 and times_pressed == 0:
			level += 1
	if level == 3:
		finished.emit(true)
	if previous_level == level:
		finished.emit(false)
		ScenesManager.minigames_node.clear_minigames()
	
	var next_time: int
	if level == 1:
		next_time = 12
	else:
		next_time = 8
	
	times_pressed = 0
	selected_color = colors.pick_random()
	var stylebox = main_light.get_theme_stylebox("panel")
	stylebox.bg_color = selected_color
	main_light.add_theme_stylebox_override("panel", stylebox)
	time_started = int(ScenesManager.hud.timer.time_left) % 60
	time_label.text = "STARTED AT:\n" + str(int(int(ScenesManager.hud.timer.time_left) % 60)) + " SECONDS"
	timer.wait_time = next_time
	timer.start()

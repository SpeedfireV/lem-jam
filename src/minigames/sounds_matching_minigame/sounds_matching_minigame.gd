class_name SoundsMatchingMinigame extends Control

signal finished(win: bool)

var sounds: Array[AudioStreamWAV] = [
	preload("res://assets/sounds/sfx/pulsacja_sound.wav"),
	preload("res://assets/sounds/sfx/szum_sound.wav"),
	preload("res://assets/sounds/sfx/pisk_sound.wav"),
	preload("res://assets/sounds/sfx/maszyna_sound.wav"),
	preload("res://assets/sounds/sfx/alarm_sound.wav"),
]

@onready var repeat_button: Button = $VBoxContainer/HBoxContainer/RepeatButton
@onready var accept_button: Button = $VBoxContainer/HBoxContainer/AcceptButton
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var input_label: Label = $VBoxContainer/Label

@onready var button1: Button = $VBoxContainer/HBoxContainer/ButtonsSoundContainer/Button1
@onready var button2: Button = $VBoxContainer/HBoxContainer/ButtonsSoundContainer/Button2
@onready var button3: Button = $VBoxContainer/HBoxContainer/ButtonsSoundContainer/Button3
@onready var button4: Button = $VBoxContainer/HBoxContainer/ButtonsSoundContainer/Button4
@onready var button5: Button = $VBoxContainer/HBoxContainer/ButtonsSoundContainer/Button5

var buttons: Array[Button] = []

var order: Array[int] = [0,1,2,3,4]
var entered_order: Array[int] = []

var currently_played_sound: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	order.shuffle()
	buttons.append(button1)
	buttons.append(button2)
	buttons.append(button3)
	buttons.append(button4)
	buttons.append(button5)

	for i in range(len(buttons)):
		buttons[i].pressed.connect(_on_number_button_pressed.bind(i))

	repeat_button.pressed.connect(play_sound)
	audio_player.finished.connect(sound_finished)
	accept_button.pressed.connect(check_sequence)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	input_label.text = ""
	for i in range(len(entered_order)):
		input_label.text += "X"
	if len(entered_order) == 5:
		accept_button.disabled = false
	else:
		accept_button.disabled = true


func play_sound():
	print(currently_played_sound)
	var selected_sound: int = order[currently_played_sound]
	audio_player.stream = sounds[selected_sound]
	audio_player.play()

func sound_finished():
	if currently_played_sound < 4:
		currently_played_sound += 1
		play_sound()
	else:
		currently_played_sound = 0

func _on_number_button_pressed(number: int):
	if len(entered_order) < 5:
		entered_order.append(number)
	else:
		pass
		# ERROR SOUND

func check_sequence():
	if entered_order == order:
		finished.emit(true)
	else:
		finished.emit(false)
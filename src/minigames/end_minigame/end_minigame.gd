extends Control

signal finished(win: bool)

@onready var button1: Button = $VBoxContainer/HBoxContainer/Button1
@onready var button2: Button = $VBoxContainer/HBoxContainer/Button2
@onready var button3: Button = $VBoxContainer/HBoxContainer/Button3
@onready var button4: Button = $VBoxContainer/HBoxContainer/Button4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button1.pressed.connect(_on_button1_pressed)
	button2.pressed.connect(_on_button2_pressed)
	button3.pressed.connect(_on_button3_pressed)
	button4.pressed.connect(_on_button4_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button1_pressed():
	pass
func _on_button2_pressed():
	pass
func _on_button3_pressed():
	pass
func _on_button4_pressed():
	pass

extends Control

@onready var crab_button: TextureButton = $VBoxContainer/HBoxContainer/TextureButton1
@onready var crab_label: Label = $VBoxContainer/HBoxContainer/TextureButton1/Label
@onready var crab_normal: CompressedTexture2D = preload("res://assets/graphics/objects/krab.png")
@onready var crab_pressed: CompressedTexture2D = preload("res://assets/graphics/objects/krab_klik.png")

@onready var lion_button: TextureButton = $VBoxContainer/HBoxContainer/TextureButton2
@onready var lion_label: Label = $VBoxContainer/HBoxContainer/TextureButton2/Label
@onready var lion_normal: CompressedTexture2D = preload("res://assets/graphics/objects/lew.png")
@onready var lion_pressed: CompressedTexture2D = preload("res://assets/graphics/objects/lew_klik.png")
@onready var fish_button: TextureButton = $VBoxContainer/HBoxContainer/TextureButton3
@onready var fish_label: Label = $VBoxContainer/HBoxContainer/TextureButton3/Label
@onready var fish_normal: CompressedTexture2D = preload("res://assets/graphics/objects/ryba.png")
@onready var fish_pressed: CompressedTexture2D = preload("res://assets/graphics/objects/ryba_klik.png")
@onready var deer_button: TextureButton = $VBoxContainer/HBoxContainer/TextureButton4
@onready var deer_label: Label = $VBoxContainer/HBoxContainer/TextureButton4/Label
@onready var deer_normal: CompressedTexture2D = preload("res://assets/graphics/objects/sarna.png")
@onready var deer_pressed: CompressedTexture2D = preload("res://assets/graphics/objects/sarna_klik.png")

@onready var accept_button = $VBoxContainer/AcceptButton

var correct_sequence = [3, 0, 2]
var entered_sequence = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	crab_button.pressed.connect(add_move.bind(0, crab_button, crab_normal, crab_pressed))
	lion_button.pressed.connect(add_move.bind(1, lion_button, lion_normal, lion_pressed))
	fish_button.pressed.connect(add_move.bind(2, fish_button, fish_normal, fish_pressed))
	deer_button.pressed.connect(add_move.bind(3, deer_button, deer_normal, deer_pressed))
	accept_button.pressed.connect(accept_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_move(number: int, button: TextureButton, normal: CompressedTexture2D, pressed: CompressedTexture2D):
	var stylebox: StyleBoxTexture = button.get_theme_stylebox("normal")
	if entered_sequence.count(number) > 0:
		stylebox.texture = normal
		entered_sequence.erase(number)
	else:
		entered_sequence.append(number)
		stylebox.texture = pressed

func accept_pressed():
	pass
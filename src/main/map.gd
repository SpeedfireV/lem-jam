class_name Map extends TileMapLayer

var door0 = Vector2(-1, -4)
var door1 = Vector2(-1, -16)
var door2 = Vector2(-6, -20)
var door3 = Vector2(-6, -20)
var door7 = Vector2(10, -26)
var final_door = Vector2(-1, -24)

var floor_tile = Vector2(1,2)

var door_open_sound: AudioStreamWAV = preload("res://assets/sounds/sfx/door_open_sound.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScenesManager.map = self

func _process(delta):
	if ScenesManager.finished_games > 5:
		open_final_door()
		ScenesManager.finished_games = 0

func open_door(door_pos):
	$AudioStreamPlayer.play()
	set_cell(door_pos, 1, floor_tile)
	

func open_door0():
	open_door(door0)

func open_door7():
	open_door(door7)	

func open_final_door():
	open_door(final_door)	

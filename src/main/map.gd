class_name Map extends TileMapLayer

var door0 = Vector2(-1, -4)
var door1 = Vector2(-1, -16)
var door2 = Vector2(-6, -20)
var door3 = Vector2(-6, -20)
var door7 = Vector2(10, -26)
var final_door = Vector2(-1, -24)

var floor_tile = Vector2(1,2)

var audio_player: AudioStreamPlayer
var door_open_sound: AudioStreamWAV = preload("res://assets/sounds/sfx/door_open_sound.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScenesManager.map = self

func _process(delta):
	if ScenesManager.finished_games > 0:
		open_final_door()


func open_door(door_pos):
	set_cell(door_pos, 1, floor_tile)
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.stream = door_open_sound
	audio_player.play()
	audio_player.finished.connect(player_finished)

func open_door0():
	open_door(door0)

func open_door7():
	open_door(door7)	

func open_final_door():
	open_door(final_door)	

func player_finished():
	audio_player.queue_free()

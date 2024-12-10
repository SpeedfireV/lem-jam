extends Node



# Called when the node enters the scene tree for the first time.
#func _ready():
	#var target_screen = 2  # Change to the desired screen index (starting from 0)
	#var screen_count = DisplayServer.get_screen_count()
#
	#if target_screen < screen_count:
		#DisplayServer.window_set_current_screen(target_screen)
		#print("Window moved to screen: ", target_screen)
	#else:
		#print("Invalid screen index. There are only ", screen_count, " screens available.")
func _ready():
	$Song1.play()
	$Song1.finished.connect($Song2.play)
	$Song2.finished.connect($Song3.play)
	$Song3.finished.connect($Song4.play)
	$Song4.finished.connect($Song5.play)
	$Song5.finished.connect($Song6.play)


func _input(event):
	if Input.is_action_just_pressed("ExitGame"):
		get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

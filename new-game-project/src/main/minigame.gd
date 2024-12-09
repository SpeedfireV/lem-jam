class_name Minigame extends CanvasLayer

@onready var done_message = $DoneMessage
@onready var animation = $AnimationPlayer

func game_complete():
	done_message.visible = true
	animation.play("win")
	done_message.visible = false

func exit_minigame():
	queue_free()

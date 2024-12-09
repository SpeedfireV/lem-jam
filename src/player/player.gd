class_name Player extends CharacterBody2D

const SPEED = 500.0
var direction: Vector2 = Vector2.ZERO
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	
	if direction == Vector2.ZERO:
		animation.animation = "idle"
	else:
		animation.animation = "move"
	if direction.x > 0:
		animation.flip_h = false
	elif direction.x < 0:
		animation.flip_h = true
	
	print(animation.animation)
	move_and_slide()

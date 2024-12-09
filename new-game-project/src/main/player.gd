extends CharacterBody2D
class_name Player

const SPEED = 500.0
var direction: Vector2

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	if direction == Vector2.ZERO:
		animation.animation = "idle"
	else:
		animation.animation = "running"
	if direction.x > 0:
		animation.flip_h = false
	elif direction.x < 0:
		animation.flip_h = true
	
	move_and_slide()

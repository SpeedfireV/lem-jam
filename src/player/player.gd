extends CharacterBody2D

const SPEED = 500.0
var direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()

class_name Player extends CharacterBody2D

const MAX_SPEED = 50	
const ACC = 4
var direction: Vector2 = Vector2.ZERO
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var particles: CPUParticles2D = $CPUParticles2D

func _ready():
	animation.play()
	ScenesManager.player = self

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity += direction * ACC
	if velocity.length() > MAX_SPEED:
		velocity = velocity / (velocity.length() / MAX_SPEED)
	if direction == Vector2.ZERO:
		velocity *= 0.97
	particles.gravity = -velocity * 0.5
	particles.rotation_degrees = Vector2.ZERO.angle_to_point(velocity)
	if velocity.length() / 50 < 0.5:
		particles.emitting = false
	else:
		if particles.emitting != true:
			particles.emitting = true
		

	
	if velocity.length() < 3:
		animation.animation = "idle"
	else:
		animation.animation = "move"
	if velocity.x > 0:
		animation.flip_h = false
	elif velocity.x < 0:
		animation.flip_h = true
	move_and_slide()

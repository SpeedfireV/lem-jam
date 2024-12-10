class_name Player extends CharacterBody2D

const SPEED = 64
var direction: Vector2 = Vector2.ZERO
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var particles: CPUParticles2D = $CPUParticles2D

func _ready():
	animation.play()
	ScenesManager.player = self

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	particles.gravity = -direction * 200
	
	if direction == Vector2.ZERO:
		animation.animation = "idle"
	else:
		animation.animation = "move"
	if direction.x > 0:
		animation.flip_h = false
	elif direction.x < 0:
		animation.flip_h = true
	move_and_slide()

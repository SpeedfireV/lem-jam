class_name InterationAreaTemplate extends Area2D

@onready var interaction_polygon: CollisionPolygon2D = $InteractionPolygonCollsion
var minigame: MinigameViewTemplate

var is_player_inside: bool = false

func _ready():
	self.body_entered.connect(player_entered_area)
	self.body_exited.connect(player_exited_area)

func _input(event):
	if Input.is_action_just_pressed("enter_minigame") and is_player_inside :
		ScenesManager.minigames_node.set_minigame(minigame)


func player_entered_area(body: Node2D):
	if body is Player:
		is_player_inside = true

func player_exited_area(body: Node2D):
	if body is Player:
		is_player_inside = false
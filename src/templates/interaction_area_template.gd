class_name InterationAreaTemplate extends Area2D


# TODO: ADD BACKGROUND!!!!!!!!!
@onready var interaction_polygon: CollisionPolygon2D = $InteractionPolygonCollsion
@onready var background_map = $GameMap
@export var minigame: PackedScene

var interaction_info: Label

var is_player_inside: bool = false

func _ready():
	background_map.queue_free()
	self.body_entered.connect(player_entered_area)
	self.body_exited.connect(player_exited_area)

func _input(event):
	if Input.is_action_just_pressed("enter_minigame") and is_player_inside:
		var new_minigame = minigame.instantiate() # JAK TO GÓWNO NIE DZIAŁA TO NIE WYBRAŁEŚ MINIGRY PRZYPISANEJ DO TEJ AREA
		ScenesManager.minigames_node.set_minigame(new_minigame)


func player_entered_area(body: Node2D):
	if body is Player:
		is_player_inside = true
	

func player_exited_area(body: Node2D):
	if body is Player:
		is_player_inside = false
	if interaction_info:
		interaction_info.queue_free()

func dispose_area():
	queue_free()

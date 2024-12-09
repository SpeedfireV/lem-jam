class_name InterationAreaTemplate extends Area2D

@onready var interaction_polygon: CollisionPolygon2D = $InteractionPolygonCollsion


func _ready():
	self.body_entered.connect(player_entered_area)
	self.body_exited.connect(player_exited_area)




func player_entered_area(body: Node2D):
	if body is Player:
		pass

func player_exited_area(body: Node2D):
	pass
extends TileMapLayer

func _ready():
	# Ensure this runs after the Control node is fully initialized
	if get_parent() and get_parent() is Control:
		var parent = get_parent() as Control
		var center_position = Vector2(300,100)  # Center of the Control
		position = center_position

extends GridContainer

func _ready():
	
	for i in range(16*16):
		var cell: Panel = Panel.new()
		cell.custom_minimum_size = Vector2(32, 32)
		var stylebox: StyleBoxFlat = StyleBoxFlat.new()
		stylebox.bg_color = Color.GRAY
		cell.add_theme_stylebox_override("panel", stylebox)
		add_child(cell)
		print("ADDED!")

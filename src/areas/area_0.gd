extends InterationAreaTemplate


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func player_entered_area(body: Node2D):
	super.player_entered_area(body)
	
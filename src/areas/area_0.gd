extends InterationAreaTemplate


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func player_entered_area(body: Node2D):
	interaction_info = Label.new()
	interaction_info.text = "[INTERACT WITH MINIGAME]\nSPACE"
	super.player_entered_area(body)
	ScenesManager.hud.add_info(interaction_info)

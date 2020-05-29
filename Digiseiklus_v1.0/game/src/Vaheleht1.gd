extends Control

func _ready():
	AudioEffects.get_node("küsimuse_taust").stop()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	TeleporterData.player_location1 = Vector2(236.82,789.579)
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().change_scene("res://src/Levels/Level1.tscn")
	




extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioEffects.get_node("küsimuse_taust").stop()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().change_scene("res://src/Levels/Level2.tscn")

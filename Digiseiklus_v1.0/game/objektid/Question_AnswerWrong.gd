extends Node2D
var timer = null

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(1.5)
	timer.connect("timeout", self, "on_timeout")
	add_child(timer)
	timer.start()
	
func on_timeout():
	if CheckpointRed1.isCheckpoint1:
		get_tree().change_scene("res://src/Levels/Level1.tscn")
		TeleporterData.player_location = Vector2(236.82,789.579)
	elif CheckpointRed2.isCheckpoint2:
		get_tree().change_scene("res://src/Levels/Level1.tscn")
		TeleporterData.player_location = CheckpointRed1.teleport_location
	elif CheckpointRed3.isCheckpoint3:
		get_tree().change_scene("res://src/Levels/Level1.tscn")
		TeleporterData.player_location = CheckpointRed2.teleport_location
	elif CheckpointRed4.isCheckpoint4:
		get_tree().change_scene("res://src/Levels/Level1.tscn")
		TeleporterData.player_location = CheckpointRed3.teleport_location

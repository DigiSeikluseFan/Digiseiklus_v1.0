extends Control

func _ready():
	TeleporterData.isQuestionBox
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	if  CheckpointRed1.isCheckpoint1:	
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://src/Levels/Level1.tscn")
		TeleporterData.player_location1 = TeleporterData.CP1_location
		TeleporterData.isCheckpointPassed = true
	elif CheckpointRed2.isCheckpoint2:
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://src/Levels/Level1.tscn")
		TeleporterData.player_location1 = TeleporterData.CP2_location
		TeleporterData.isCheckpointPassed = true
	elif CheckpointRed3.isCheckpoint3:
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://src/Levels/Level1.tscn")
		TeleporterData.player_location1 = TeleporterData.CP3_location
		TeleporterData.isCheckpointPassed = true
	elif CheckpointRed4.isCheckpoint4:
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://src/Levels/Level1.tscn")
		TeleporterData.player_location1 = TeleporterData.CP4_location
		TeleporterData.isCheckpointPassed = true
	elif CheckpointRed5.isCheckpoint5:
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://src/Tase_läbitud.tscn")
		TeleporterData.player_location1 = Vector2(142.066, 699.882)
		TeleporterData.isCheckpointPassed = true	
	elif CheckpointRed21.isCheckpoint2_1:
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://src/Levels/Level2.tscn")
		TeleporterData.player_location2 = TeleporterData.CP2_1_location
		TeleporterData.isCheckpointPassed = true
	elif CheckpointRed22.isCheckpoint2_2:
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://src/Levels/Level2.tscn")
		TeleporterData.player_location2 = TeleporterData.CP2_2_location
		TeleporterData.isCheckpointPassed = true
	elif CheckpointRed23.isCheckpoint2_3:
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://src/Levels/Level2.tscn")
		TeleporterData.player_location2 = TeleporterData.CP2_3_location
		TeleporterData.isCheckpointPassed = true
	elif CheckpointRed24.isCheckpoint2_4:
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://src/Levels/Level2.tscn")
		TeleporterData.player_location2 = TeleporterData.CP2_4_location
		TeleporterData.isCheckpointPassed = true
	elif CheckpointRed25.isCheckpoint2_5:
		yield(get_tree().create_timer(3.0), "timeout")
		get_tree().change_scene("res://src/Mäng_läbitud.tscn")
		TeleporterData.isCheckpointPassed = true
			

func _on_ExitGame_button_up():
	get_tree().quit()

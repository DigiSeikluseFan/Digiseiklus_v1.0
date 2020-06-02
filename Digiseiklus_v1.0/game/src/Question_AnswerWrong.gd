extends Control

func _ready():
	TeleporterData.isQuestionBox
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if TeleporterData.isLevel1:
		if CheckpointRed1.isCheckpoint1:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level1.tscn")
			TeleporterData.player_location1 = Vector2(236.82,789.579)
		elif CheckpointRed2.isCheckpoint2:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level1.tscn")
			TeleporterData.player_location1 = TeleporterData.CP1_location
		elif CheckpointRed3.isCheckpoint3:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level1.tscn")
			TeleporterData.player_location1 = TeleporterData.CP2_location
		elif CheckpointRed4.isCheckpoint4:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level1.tscn")
			TeleporterData.player_location1 = TeleporterData.CP3_location
		elif CheckpointRed5.isCheckpoint5:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level1.tscn")
			TeleporterData.player_location1 = TeleporterData.CP4_location
	else: 
		print("Level2: ", TeleporterData.isLevel2)
		if TeleporterData.isLevel2 and  CheckpointRed21.isCheckpoint2_1:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level2.tscn")
			TeleporterData.player_location2 =  Vector2(63.086, 681.276)
		elif CheckpointRed22.isCheckpoint2_2:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level2.tscn")
		elif CheckpointRed23.isCheckpoint2_3:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level2.tscn")
			TeleporterData.player_location2 = TeleporterData.CP2_2_location
		elif CheckpointRed24.isCheckpoint2_4:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level2.tscn")
			TeleporterData.player_location2 = TeleporterData.CP2_3_location
		elif CheckpointRed25.isCheckpoint2_5:
			yield(get_tree().create_timer(2.0), "timeout")
			get_tree().change_scene("res://src/Levels/Level2.tscn")
			TeleporterData.player_location2 = TeleporterData.CP2_4_location

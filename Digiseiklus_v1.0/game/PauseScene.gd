extends Control

func _input(event):
	
	if event.is_action_pressed("ui_cancel"):
		$ColorRect/ExitToMain.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		print(TeleporterData.soundIsON)
		if TeleporterData.soundIsON:
			get_node("ColorRect/SoundON").visible = true
		else:
			get_node("ColorRect/SoundOFF").visible = true
	
func _on_Continue_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	if TeleporterData.isQuestionBox:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_ExitToMain_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")
	TeleporterData.player_location1 = Vector2(236.82,789.579)
	TeleporterData.player_location1 = Vector2(236.82,789.579)
	TeleporterData.isLevel1 = true
	CheckpointRed1.isCheckpoint1 = true
	CheckpointRed2.isCheckpoint2 = true
	CheckpointRed3.isCheckpoint3 = true
	CheckpointRed4.isCheckpoint4 = true
	CheckpointRed5.isCheckpoint5 = true
	CheckpointRed21.isCheckpoint2_1 = true
	CheckpointRed22.isCheckpoint2_2 = true
	CheckpointRed23.isCheckpoint2_3 = true
	CheckpointRed24.isCheckpoint2_4 = true
	CheckpointRed25.isCheckpoint2_5 = true
	get_tree().paused = not get_tree().paused
	visible = not visible
	
func _on_SoundON_button_up():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true) 
	TeleporterData.soundIsON = false
	get_node("ColorRect/SoundOFF").visible = true
	get_node("ColorRect/SoundON").visible = false
func _on_SoundOFF_button_up():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)	
	get_node("ColorRect/SoundOFF").visible = false
	get_node("ColorRect/SoundON").visible = true
	TeleporterData.soundIsON = true

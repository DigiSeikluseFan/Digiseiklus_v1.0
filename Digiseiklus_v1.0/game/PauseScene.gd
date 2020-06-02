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
	get_tree().paused = not get_tree().paused
	visible = not visible


func _on_SoundON_button_up():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true) 
	print("sound off")
	TeleporterData.soundIsON = false
	get_node("ColorRect/SoundOFF").visible = true
	get_node("ColorRect/SoundON").visible = false
	print(TeleporterData.soundIsON)
func _on_SoundOFF_button_up():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)	
	print("sound on")
	get_node("ColorRect/SoundOFF").visible = false
	get_node("ColorRect/SoundON").visible = true
	TeleporterData.soundIsON = true
	print(TeleporterData.soundIsON)

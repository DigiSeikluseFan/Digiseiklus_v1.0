extends Control

func _on_SoundON_button_up():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true) 
	TeleporterData.soundIsON = false
	get_node("SoundON").visible = false
	get_node("SoundOFF").visible = true
	
func _on_SoundOFF_button_up():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)	
	get_node("SoundON").visible =true
	get_node("SoundOFF").visible = false
	TeleporterData.soundIsON = true
	

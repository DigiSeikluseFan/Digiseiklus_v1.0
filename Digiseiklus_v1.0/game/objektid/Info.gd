extends Control

onready var soundON = get_node("SoundON2")
onready var soundOFF = get_node("SoundOFF")

func _on_Exit_pressed():
	get_tree().quit()

func _on_Sound_pressed():
	if soundON.visible == true:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true) 
		soundON.visible = false
		soundOFF.visible = true
		print("sound off")
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		soundON.visible = true
		soundON.texture_normal
		soundOFF.visible = false
		print("sound on")

func _on_Exit_toMain_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")


func _on_Tiim_pressed():
	get_tree().change_scene("res://src/Tiimist.tscn")


func _on_Juhend_pressed():
	get_tree().change_scene("res://src/Juhend.tscn")


func _on_Alusta_pressed():
	get_tree().change_scene("res://src/Vaheleht1.tscn")

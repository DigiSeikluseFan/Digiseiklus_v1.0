extends Control

onready var soundON = get_node("SoundON2")
onready var soundOFF = get_node("SoundOFF")
func _ready():
	var screen_size = OS.get_screen_size(OS.get_current_screen())
	var window_size = OS.get_window_size()
	var centered_pos = (screen_size - window_size) / 2
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	AudioEffects.get_node("küsimuse_taust").play()
	

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

func _on_Tiim_pressed():
	get_tree().change_scene("res://src/Tiimist.tscn")
	
func _on_Juhend_pressed():
	get_tree().change_scene("res://src/Juhend.tscn")
	
func _on_Alusta_pressed():
	get_tree().change_scene("res://src/Vaheleht1.tscn")

func _on_Exit_toMain_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")


func _on_UserInterface_tree_exited():
	AudioEffects.get_node("küsimuse_taust").stop()

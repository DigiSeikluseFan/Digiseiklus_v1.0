extends Control
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	AudioEffects.get_node("küsimuse_taust").stop()
	AudioEffects.get_node("Taseläbi").play()
func _on_Edasi_pressed():
	get_tree().change_scene("res://src/Vaheleht2.tscn")
	print("Chippy location: ", TeleporterData.player_location1)
	TeleporterData.isCheckpoint5 = false
func _on_Katkesta_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")

func _on_Algusest_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")
	TeleporterData.player_location1 = Vector2(236.82,789.579)

func _on_exit_game_pressed():
	get_tree().quit()

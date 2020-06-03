extends Control
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	AudioEffects.get_node("küsimuse_taust").stop()
	AudioEffects.get_node("Taseläbi").play()
func _on_Edasi_pressed():
	get_tree().change_scene("res://src/Vaheleht2.tscn")
	TeleporterData.isCheckpoint5 = false
func _on_Katkesta_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")
	TeleporterData.player_location1 = Vector2(236.82,789.579)

func _on_Algusest_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")
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

func _on_exit_game_pressed():
	get_tree().quit()

extends Control
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	AudioEffects.get_node("küsimuse_taust").stop()
	AudioEffects.get_node("Taseläbi").play()
func _on_Edasi_pressed():
	get_tree().change_scene("res://src/Vaheleht2.tscn")

func _on_Katkesta_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")

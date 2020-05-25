extends Control
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
func _on_Edasi_pressed():
	get_tree().change_scene("res://src/Vaheleht2.tscn")


func _on_Katkesta_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")

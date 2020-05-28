extends Control


func _input(event):
	
	if event.is_action_pressed("ui_cancel"):
		$CenterContainer/HBoxContainer/ExitToMain.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_ExitToMain_pressed():
	get_tree().change_scene("res://src/UserInterface.tscn")
	get_tree().paused = not get_tree().paused
	visible = not visible
func _on_Continue_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

extends Area2D
export(String, FILE, "*.tscn") var level_scene

export (Vector2) var teleport_location = Vector2(3884.2, 806.156)

var isCheckpoint1 = true

func _on_Checkpoint_red1_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene("res://objektid/Question_Box.tscn")
		

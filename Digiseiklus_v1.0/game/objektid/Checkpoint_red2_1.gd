extends Area2D
export(String, FILE, "*.tscn") var level_scene

export (Vector2) var teleport_location = Vector2(3884.2, 806.156)

var isCheckpoint2_1 = true


func _on_Checkpoint_red2_1_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene("res://objektid/Question_Box.tscn")
		print("On level1: ",TeleporterData.isLevel1,"On level2: ", TeleporterData.isLevel2, "Checkpoint_red2_1", TeleporterData.player_location2, "Chippy location 1 ", TeleporterData.player_location1)
		
		CheckpointRed5.isCheckpoint5 = false
	

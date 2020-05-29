extends Area2D
export(String, FILE, "*.tscn") var level_scene

export (Vector2) var teleport_location = Vector2(7402.332, 700.833)
var isCheckpoint2_2 = true

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(level_scene)
			CheckpointRed21.isCheckpoint2_1 = false
			print("Checkpoint_red2_2", TeleporterData.player_location2, "Chippy location 1 ", TeleporterData.player_location1)

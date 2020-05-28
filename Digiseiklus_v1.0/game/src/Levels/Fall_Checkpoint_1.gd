extends Area2D
func _physics_process(_delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name=="Player":
			if TeleporterData.isLevel1:	
				AudioEffects.get_node("allakukkumine").play()
				yield(get_tree().create_timer(0.8), "timeout")
				body.set_position(TeleporterData.player_location1)
				
			else:
				AudioEffects.get_node("allakukkumine").play()
				yield(get_tree().create_timer(0.8), "timeout")
				body.set_position(TeleporterData.player_location2)
				
				

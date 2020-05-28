extends Area2D

func _physics_process(_delta):
	var bodies=get_overlapping_bodies()
	for body in bodies:
		if body.name=="Player":
			if TeleporterData.isLevel1:	
				body.set_position(TeleporterData.player_location1)
				AudioEffects.get_node("chippy_vigastus").play()
			else:
				body.set_position(TeleporterData.player_location2)
				AudioEffects.get_node("chippy_vigastus").play()
				

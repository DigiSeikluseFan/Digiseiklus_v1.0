extends Node2D
export (PackedScene) var player
var isGreenVisible = false

func _ready():
	TeleporterData.isLevel1 = true
	AudioEffects.get_node("küsimuse_taust").stop()
	var screen_size = OS.get_screen_size(OS.get_current_screen())
	var window_size = OS.get_window_size()
	var centered_pos = (screen_size - window_size) / 2
	OS.set_window_position(centered_pos)
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	var audioPlayer = AudioStreamPlayer.new()
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://assets/helid/taustamuusika4.1.wav")
	audioPlayer.play()
	
	var location = TeleporterData.player_location1
	var p = player.instance()
	add_child(p)
	p.set_position(location)
	
	if location >= TeleporterData.CP1_location and location < TeleporterData.CP2_location and TeleporterData.isCheckpointPassed == true:
		print("Chips 1",location)
		get_node("Checkpoint_green1").visible = true
		get_node("Checkpoint_red1").visible = false
		get_node("Checkpoint_red1/CollisionShape2D").set_deferred("disabled", true)
	if location >= TeleporterData.CP2_location and location <= TeleporterData.CP3_location and TeleporterData.isCheckpointPassed == true:
		print("Chippy location2: ", location)
		get_node("Checkpoint_green2").visible = true
		get_node("Checkpoint_red2").visible = false
		get_node("Checkpoint_red2/CollisionShape2D").set_deferred("disabled", true)
	if location >= TeleporterData.CP3_location and location <= TeleporterData.CP4_location and TeleporterData.isCheckpointPassed == true:
		print("Chippy location3: ", location)
		get_node("Checkpoint_green3").visible = true
		get_node("Checkpoint_red3").visible = false
		get_node("Checkpoint_red3/CollisionShape2D").set_deferred("disabled", true)
	if location >= TeleporterData.CP4_location and location <= get_node("Checkpoint_red5").teleport_location and TeleporterData.isCheckpointPassed == true:
		print("Chippy location4: ", location)
		get_node("Checkpoint_green4").visible = true
		get_node("Checkpoint_red4").visible = false
		get_node("Checkpoint_red4/CollisionShape2D").set_deferred("disabled", true)
	

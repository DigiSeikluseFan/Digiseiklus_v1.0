extends Node2D
export (PackedScene) var player
var isGreenVisible = false

func _ready():
	TeleporterData.isLevel2 = true
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
	var location = TeleporterData.player_location2
	var p = player.instance()
	add_child(p)
	p.set_position(location)
	
	if location >= TeleporterData.CP2_1_location and location < TeleporterData.CP2_2_location and TeleporterData.isCheckpointPassed == true:
		print("Chips 2 level",location)
		get_node("Checkpoint_green1").visible = true
		get_node("Checkpoint_red2_1").visible = false
		get_node("Checkpoint_red2_1/CollisionShape2D").set_deferred("disabled", true)
	if location >= TeleporterData.CP2_2_location and location < TeleporterData.CP2_3_location and TeleporterData.isCheckpointPassed == true:
		print("Chippy location2: ", location)
		get_node("Checkpoint_green2").visible = true
		get_node("Checkpoint_red2_2").visible = false
		get_node("Checkpoint_red2_2/CollisionShape2D").set_deferred("disabled", true)
	if location >= TeleporterData.CP2_3_location and location < TeleporterData.CP2_4_location and TeleporterData.isCheckpointPassed == true:
		print("Chippy location3: ", location)
		get_node("Checkpoint_green3").visible = true
		get_node("Checkpoint_red2_3").visible = false
		get_node("Checkpoint_red2_3/CollisionShape2D").set_deferred("disabled", true)
	if location >= TeleporterData.CP2_4_location and location < TeleporterData.CP2_5_location and TeleporterData.isCheckpointPassed == true:
		print("Chippy location2_4: ", location)
		get_node("Checkpoint_green4").visible = true
		get_node("Checkpoint_red2_4").visible = false
		get_node("Checkpoint_red2_4/CollisionShape2D").set_deferred("disabled", true)


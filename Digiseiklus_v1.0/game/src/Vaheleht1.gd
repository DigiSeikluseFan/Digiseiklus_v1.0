extends Control

var timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(2)
	timer.connect("timeout", self, "on_timeout")
	add_child(timer)
	timer.start()

func on_timeout():
	get_tree().change_scene("res://src/Levels/Level1.tscn")

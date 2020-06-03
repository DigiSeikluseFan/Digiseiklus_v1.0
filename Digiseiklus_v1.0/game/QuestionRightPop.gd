extends Control

func _ready():
	welcome()
	print("Hello")

func welcome():
	yield(get_tree().create_timer(1.0), "timeout")
	var popup = WindowDialog.new()
	popup.set_title("Welcome!")
	popup.popup(Rect2(10, 10, 200, 200))
	add_child(popup)
	popup.show()
	yield(get_tree().create_timer(2.0), "timeout")
	popup.hide()

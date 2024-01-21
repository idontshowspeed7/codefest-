extends Node

var initial_value : int = 100

func _process(delta):
	if Input.is_action_just_pressed("punch"):
		initial_value -= 5
	if Input.is_action_just_pressed("down"):
		initial_value -= 10



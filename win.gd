extends TextureRect


func _on_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	


func _on_rematch_pressed():
	get_tree().change_scene_to_file("res://node.tscn")

extends Node


func _on_local_pressed():
	get_tree().change_scene_to_file("res://node.tscn")


func _on_online_pressed():
	get_tree(). change_scene_to_file("res://howtoplay.tscn")
	

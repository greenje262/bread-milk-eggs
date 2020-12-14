extends Control

func _ready():
	$ButtonBox/Play.grab_focus()
	$TextureRect/Tween.interpolate_property($TextureRect, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2, Tween.TRANS_LINEAR)
	$TextureRect/Tween.start()	

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_Quit_pressed():
	get_tree().quit()

func _on_Play_pressed():
	$TextureRect/Tween.interpolate_property($TextureRect, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 2, Tween.TRANS_LINEAR)
	$TextureRect/Tween.start()
	yield($TextureRect/Tween, "tween_completed")
	get_tree().change_scene("res://scenes/GroceryStore.tscn")

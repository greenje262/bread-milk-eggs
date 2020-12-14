extends Node2D

func _ready():
	$SortStack/Player/AudioStreamPlayer2D/AudioTween.interpolate_property($SortStack/Player/AudioStreamPlayer2D, "volume_db", -80, 0, 2, Tween.TRANS_LINEAR)
	$SortStack/Player/AudioStreamPlayer2D/AudioTween.start()
	$SortStack/Player/Camera2D/TextureRect/FadeTween.interpolate_property($SortStack/Player/Camera2D/TextureRect, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2, Tween.TRANS_LINEAR)
	$SortStack/Player/Camera2D/TextureRect/FadeTween.start()

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_Exit_body_entered(body):
	if GlobalVars.endgame == true:
		$SortStack/Player/AudioStreamPlayer2D/AudioTween.interpolate_property($SortStack/Player/AudioStreamPlayer2D, "volume_db", 0, -80, 2, Tween.TRANS_LINEAR)
		$SortStack/Player/AudioStreamPlayer2D/AudioTween.start()
		$SortStack/Player.ending()

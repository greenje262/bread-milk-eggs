extends KinematicBody2D

onready var speed = 400
onready var facing_right = true
onready var groceries = false

signal talk

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if !$Camera2D/DialogueBox.visible && $Camera2D/DialogueBox/Panel/RichTextLabel/NoTalkTimer.is_stopped() && GlobalVars.endgame == false:
			if GlobalVars.can_interact == true:
				emit_signal("talk")
				$Camera2D/DialogueBox.show()
	
	if GlobalVars.grocery_list.size() > 0:
		groceries = true

func _physics_process(delta):
	var move_vec = Vector2()
	if !$Camera2D/DialogueBox.visible:
		if Input.is_action_pressed("ui_right"):
			move_vec.x += 1
		if Input.is_action_pressed("ui_left"):
			move_vec.x -= 1
		if Input.is_action_pressed("ui_up"):
			move_vec.y -= 1
		if Input.is_action_pressed("ui_down"):
			move_vec.y += 1
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * speed * delta)
	
	if move_vec.length() > 0:
		$AnimatedSprite.play()
	elif $AnimatedSprite.frame == 0:
		$AnimatedSprite.stop()
	
	if facing_right and move_vec.x < 0:
		flip()
		$CollisionShape2D.position.x -= 77.45
		$Bag.position.x -= 345
	if !facing_right and move_vec.x > 0:
		flip()
		$CollisionShape2D.position.x += 77.45
		$Bag.position.x += 345

func flip():
	facing_right = !facing_right
	$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h

func ending():
	$Camera2D/TextureRect/FadeTween.interpolate_property($Camera2D/TextureRect, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 2, Tween.TRANS_LINEAR)
	$Camera2D/TextureRect/FadeTween.start()

func _on_FadeTween_tween_completed(object, key):
	if GlobalVars.endgame == true:
		get_tree().change_scene("res://scenes/EndScene.tscn")

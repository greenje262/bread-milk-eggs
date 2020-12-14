extends RichTextLabel

var dialogue
var dialogue_vanilla
var dialogue_yes
var dialogue_no
var dialogue_extra
var page
var interact

var groceries = []
var checkout_time = false
var belt
onready var tween = get_node("/root/GroceryStore/BeltJune/TweenJune")

signal done_spelling

func _ready():
	get_node("/root/GroceryStore/SortStack/Player").connect("talk", self, "dialogue_start")

func dialogue_start():
	fetch_dialogue()
	update_dialogue()

func _input(event):
	if Input.is_action_just_pressed("dialog_next"):
		if get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox").visible:
			if get_visible_characters() > get_total_character_count():
				if tween.is_active() == false:
					emit_signal("done_spelling")
					if page < dialogue.size() - 1:
						page += 1
						update_dialogue()
					elif page == dialogue.size() - 1:
						$NoTalkTimer.start(0.5)
						dialogue_end()
			else:
				set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)

func fetch_dialogue():
	var path
	
	page = 0
	
	match GlobalVars.npc:
		"Flower":
			path = get_node("/root/GroceryStore/SortStack/Flower")
			interact = GlobalVars.flower_interact
			GlobalVars.flower_interact += 1
		"Legs":
			path = get_node("/root/GroceryStore/SortStack/Legs")
			interact = GlobalVars.legs_interact
			GlobalVars.legs_interact += 1
		"June":
			path = get_node("/root/GroceryStore/SortStack/June")
			interact = GlobalVars.june_interact
			GlobalVars.june_interact += 1
		"Doc":
			path = get_node("/root/GroceryStore/SortStack/Doc")
			interact = GlobalVars.doc_interact
			GlobalVars.doc_interact += 1
		"Food":
			dialogue = [{"icon": "Food", "text": str("take " + GlobalVars.food_label + "?"), "choice": true}]
	
	if GlobalVars.npc == "Food":
		pass
	else:
		dialogue_vanilla = path.dialogue
		dialogue_yes = path.dialogue_yes
		dialogue_no = path.dialogue_no
		dialogue_extra = path.dialogue_extra
	
		if interact < 1:
			dialogue = dialogue_vanilla
		else:
			dialogue = dialogue_extra

func update_dialogue():
	match dialogue[page].icon:
		"Spike":
			get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox/Panel/TextureRect").set_texture(load("res://headshots/igu_yel_head.png"))
		"Flower":
			get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox/Panel/TextureRect").set_texture(load("res://headshots/ste_blu_head.png"))
		"Legs":
			get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox/Panel/TextureRect").set_texture(load("res://headshots/dim_bro_head.png"))
		"June":
			get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox/Panel/TextureRect").set_texture(load("res://headshots/rex_gre_head.png"))
		"Doc":
			get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox/Panel/TextureRect").set_texture(load("res://headshots/gal_bro_head.png"))
		"Food":
			get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox/Panel/TextureRect").set_texture(load(GlobalVars.food_icon))
	
	set_visible_characters(0)
	bbcode_text = dialogue[page].text
	
	if dialogue[page].choice == true:
		yield(self, "done_spelling")
		yield(get_tree().create_timer(0.25), "timeout")
		get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox/Panel/ButtonBox").show()
		get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox/Panel/ButtonBox/YesButton").grab_focus()
	else:
		get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox/Panel/ButtonBox").hide()
	
	if checkout_time:
		var icon = load(str(dialogue[page].skin))
		
		match GlobalVars.npc:
			"June":
				belt = get_node("/root/GroceryStore/BeltJune")
				tween = get_node("/root/GroceryStore/BeltJune/TweenJune")
				#append end dialogue
			"Doc":
				belt = get_node("/root/GroceryStore/BeltDoc")
				tween = get_node("/root/GroceryStore/BeltDoc/TweenDoc")
				#append end dialogue
		
		if dialogue[page].skin != null:
			belt.set_texture(icon)
			belt.show()
			tween.interpolate_property(belt, "position", Vector2(1200, belt.position.y), Vector2(700, belt.position.y), 1.5, Tween.TRANS_LINEAR)
			tween.start()
			yield(tween, "tween_completed")
			belt.hide()
			belt.position.x = 1200

func dialogue_end():
	if dialogue[page].choice == true:
		return
	else:
		get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox").hide()
		if checkout_time:
			get_node("/root/GroceryStore/GroceryBagDoc").hide()
			get_node("/root/GroceryStore/GroceryBagJune").hide()
			get_node("/root/GroceryStore/SortStack/Player/Bag").show()
			
			GlobalVars.endgame = true

func _on_YesButton_pressed():
	if GlobalVars.npc == "Food":
		GlobalVars.grocery_list.append({"label": GlobalVars.food_label, "skin": GlobalVars.food_icon})
		GlobalVars.food_path.queue_free()
		get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox").hide()
	elif GlobalVars.npc == "June" || GlobalVars.npc == "Doc":
		checkout()
	else:
		dialogue = dialogue_yes
		page = 0
		update_dialogue()

func _on_NoButton_pressed():
	if GlobalVars.npc == "Food":
		$NoTalkTimer.start(0.05)
		get_node("/root/GroceryStore/SortStack/Player/Camera2D/DialogueBox").hide()
	else:
		dialogue = dialogue_no
		page = 0
		update_dialogue()

func checkout():
	var grocery_dialogue
	var ender
	checkout_time = true
	groceries = GlobalVars.grocery_list
	
	match GlobalVars.npc:
		"June":
			get_node("/root/GroceryStore/GroceryBagJune").show()
			grocery_dialogue = [
				{"icon": "Spike", "text": "sure, if you don't mind.", "choice": false, "skin": null},
				{"icon": "June", "text": "of course not! okay, let's see here...", "choice": false, "skin": null}
			]
		"Doc":
			get_node("/root/GroceryStore/GroceryBagDoc").show()
			grocery_dialogue = [
				{"icon": "Spike", "text": "yeah, do you mind ringing me up?", "choice": false, "skin": null},
				{"icon": "Doc", "text": "not at all! alright, let's see here...", "choice": false, "skin": null}
			]
	
	for i in groceries:
		var label = i.label
		var skin = i.skin
		grocery_dialogue.append({"icon": str(GlobalVars.npc), "text": str(label + "..."), "choice": false, "skin": skin})
	
	match GlobalVars.npc:
		"June":
			ender = [
				{"icon": "June", "text": "...and that's everything! thanks for stopping in, Spike.", "choice": false, "skin": null},
				{"icon": "Spike", "text": "thank you! i'll see you later.", "choice": false, "skin": null},
				{"icon": "June", "text": "can't wait!", "choice": false, "skin": null}
			]
		"Doc":
			ender = [
				{"icon": "Doc", "text": "...and there you have it. all set, kiddo.", "choice": false, "skin": null},
				{"icon": "Spike", "text": "thanks Doc. have a good one!", "choice": false, "skin": null},
				{"icon": "Doc", "text": "yep, you too.", "choice": false, "skin": null}
			]
	
	for j in ender:
		grocery_dialogue.append(j)
	
	dialogue = grocery_dialogue
	page = 0
	update_dialogue()

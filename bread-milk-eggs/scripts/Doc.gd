extends StaticBody2D

var dialogue
var dialogue_extra

func _on_Area2D_body_entered(body: KinematicBody2D):
	GlobalVars.can_interact = true
	GlobalVars.npc = "Doc"
	if get_node("/root/GroceryStore/SortStack/Player").groceries == false:
		dialogue = [
			{"icon": "Doc", "text": "morning, Spike! what brings you in?", "choice": false},
			{"icon": "Spike", "text": "hey Doc. just grabbing some stuff for dinner.", "choice": false},
			{"icon": "Doc", "text": "nice. you having June over?", "choice": false},
			{"icon": "June", "text": "oh my god, Doc, shut up!", "choice": false},
			{"icon": "Spike", "text": "ha, not tonight. my parents are coming over.", "choice": false},
			{"icon": "Doc", "text": "oh, no kidding. tell them i said hi, will you?", "choice": false},
			{"icon": "Spike", "text": "for sure.", "choice": false}
		]
		
		dialogue_extra = [
			{"icon": "Doc", "text": "you let me know if you need anything, okay kiddo?", "choice": false},
			{"icon": "Spike", "text": "thanks, Doc.", "choice": false}
		]
		
	else:
		dialogue = [
			{"icon": "Doc", "text": "okay, all set to check out?", "choice": true}
		]
		
		dialogue_extra = [
			{"icon": "Doc", "text": "okay, all set to check out?", "choice": true}
		]

func _on_Area2D_body_exited(body: KinematicBody2D):
	GlobalVars.can_interact = false

var dialogue_yes = [
	{"icon": "Spike", "text": "yeah, do you mind ringing me up?", "choice": false},
	{"icon": "Doc", "text": "not at all! alright, let's see here...", "choice": false}
]

var dialogue_no = [
	{"icon": "Spike", "text": "you know, i think there are a few more things i need to pick up.", "choice": false},
	{"icon": "Doc", "text": "sure, no problem. let me know when you're ready.", "choice": false}
]

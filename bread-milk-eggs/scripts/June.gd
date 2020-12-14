extends StaticBody2D

var dialogue
var dialogue_extra

func _on_Area2D_body_entered(body: KinematicBody2D):
	GlobalVars.can_interact = true
	GlobalVars.npc = "June"
	if get_node("/root/GroceryStore/SortStack/Player").groceries == false:
		dialogue = [
			{"icon": "June", "text": "oh, Spike! good morning!", "choice": false},
			{"icon": "Spike", "text": "hey June! i didn't know you worked so early in the morning.", "choice": false},
			{"icon": "Doc", "text": "she begged Gale to switch after i told her you do most of your shopping in the morning.", "choice": false},
			{"icon": "June", "text": "DOC!! that's not true. i actually started taking classes in the afternoon, so working the morning is a lot easier for me now.", "choice": false},
			{"icon": "Spike", "text": "wow, you're taking classes too? that's really cool!", "choice": false},
			{"icon": "June", "text": "o-oh, is it? thanks!", "choice": false},
			{"icon": "Spike", "text": "don't work yourself too hard, okay? if you ever need a break, let me know. i can come over and cook you dinner sometime.", "choice": false},
			{"icon": "June", "text": "r-really? that...that sounds great. thank you, Spike.", "choice": false}
		]
		
		dialogue_extra = [
			{"icon": "June", "text": "hey! are you- i mean, did you need anything?", "choice": false},
			{"icon": "Spike", "text": "nah, just saying hi.", "choice": false},
			{"icon": "June", "text": "oh! okay. then...hi!", "choice": false}
		]
		
	else:
		dialogue = [
			{"icon": "June", "text": "all done? want me to check you out?", "choice": false},
			{"icon": "June", "text": "the groceries, i mean! want me to ring up the groceries?", "choice": true}
		]
		
		dialogue_extra = [
			{"icon": "June", "text": "all done? want me to check you out?", "choice": false},
			{"icon": "June", "text": "the groceries, i mean! want me to ring up the groceries?", "choice": true}
		]

func _on_Area2D_body_exited(body: KinematicBody2D):
	GlobalVars.can_interact = false

var dialogue_yes = [
	{"icon": "Spike", "text": "sure, if you don't mind.", "choice": false},
	{"icon": "June", "text": "of course not! okay, let's see here...", "choice": false}
]

var dialogue_no = [
	{"icon": "Spike", "text": "actually, not yet. there are a few more things i want to grab.", "choice": false},
	{"icon": "June", "text": "okay! i'll be right here when you're done.", "choice": false},
	{"icon": "June", "text": "not like waiting or anything! just...i'll be here.", "choice": false}
]

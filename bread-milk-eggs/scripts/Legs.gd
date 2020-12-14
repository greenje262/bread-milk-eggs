extends StaticBody2D

func _ready():
	$AnimatedSprite.flip_h = true

func _on_Area2D_body_entered(body: KinematicBody2D):
	GlobalVars.can_interact = true
	GlobalVars.npc = "Legs"

func _on_Area2D_body_exited(body: KinematicBody2D):
	GlobalVars.can_interact = false

var dialogue = [
	{"icon": "Legs", "text": "what's up, Spike? how's it going?", "choice": false},
	{"icon": "Spike", "text": "Legs! not too bad. just getting some dinner for tonight.", "choice": false},
	{"icon": "Legs", "text": "me too. hey, can i ask you something?", "choice": false},
	{"icon": "Spike", "text": "yeah, definitely. what's up?", "choice": false},
	{"icon": "Legs", "text": "i'm trying a new dish, and could use your input.", "choice": false},
	{"icon": "Legs", "text": "does peanut butter and spaghetti sauce sound like it would go good together?", "choice": true}
]

var dialogue_yes = [
	{"icon": "Spike", "text": "yeah, definitely! i would eat that.", "choice": false},
	{"icon": "Legs", "text": "really? cool, i thought it sounded good. thanks for your help!", "choice": false},
	{"icon": "Spike", "text": "anytime.", "choice": false},
]

var dialogue_no = [
	{"icon": "Spike", "text": "what? Legs, no, that sounds terrible.", "choice": false},
	{"icon": "Legs", "text": "yeah, i wasn't so sure about it myself.", "choice": false},
	{"icon": "Legs", "text": "thanks for your input! i'll have to try something else.", "choice": false},
]

var dialogue_extra = [
	{"icon": "Legs", "text": "can't wait for dinner tonight. thanks again for your help.", "choice": false},
	{"icon": "Spike", "text": "it's the least i can do. invite me over sometime!", "choice": false},
	{"icon": "Legs", "text": "definitely.", "choice": false}
]

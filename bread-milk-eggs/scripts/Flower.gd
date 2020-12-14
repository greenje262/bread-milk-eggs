extends StaticBody2D
	
func _on_Area2D_body_entered(body: KinematicBody2D):
	GlobalVars.can_interact = true
	GlobalVars.npc = "Flower"

func _on_Area2D_body_exited(body: KinematicBody2D):
	GlobalVars.can_interact = false

var dialogue = [
	{"icon": "Spike", "text": "whoa, Flower! stocking up for the big boom?", "choice": false},
	{"icon": "Flower", "text": "oh, hey Spike. is it a lot of food? it's for the astronomy club barbeque, but i'm not sure how much food we're going to need.", "choice": false},
	{"icon": "Flower", "text": "do you think this is too much?", "choice": true}
]

var dialogue_yes = [
	{"icon": "Spike", "text": "you might be overdoing a little bit. how many people are coming?", "choice": false},
	{"icon": "Flower", "text": "i've got around twenty people who have rsvp'd.", "choice": false},
	{"icon": "Spike", "text": "hmmm...that is a lot, isn't it?", "choice": false},
	{"icon": "Flower", "text": "yeah...", "choice": false},
	{"icon": "Spike", "text": "...", "choice": false},
	{"icon": "Flower", "text": "...", "choice": false},
	{"icon": "Spike", "text": "well, more food can't be a bad thing, right? people can take leftovers home with them.", "choice": false},
	{"icon": "Flower", "text": "that's true...okay, i'll stick with what i've got. you're still coming, right?", "choice": false},
	{"icon": "Spike", "text": "wouldn't miss it!", "choice": false},
	{"icon": "Flower", "text": "great, great. See you then!", "choice": false}
]

var dialogue_no = [
	{"icon": "Spike", "text": "nah, that looks about right. did you grab any zucchini? Gnasher loves that stuff.", "choice": false},
	{"icon": "Flower", "text": "yeah, he was quite...insistent about that.", "choice": false},
	{"icon": "Spike", "text": "sounds like him. cool! this is going to be a blast.", "choice": false},
	{"icon": "Flower", "text": "i hope so. the weather looks like it's going to cooperate, so we might even be able to spy Chicxulub!", "choice": false},
	{"icon": "Spike", "text": "is that the asteroid making its close approach soon?", "choice": false},
	{"icon": "Flower", "text": "yeah! it's really rare for an object like that to pass so close to us. i'm really excited!", "choice": false},
	{"icon": "Spike", "text": "fingers crossed the sky doesn't cloud up, then. looking forward to it!", "choice": false},
	{"icon": "Flower", "text": "me too. thanks, Spike.", "choice": false},
]

var dialogue_extra = [
	{"icon": "Flower", "text": "feel free to come over early to help cook. if you want to, i mean.", "choice": false},
	{"icon": "Spike", "text": "that'd be fun. you sure i won't be in the way?", "choice": false},
	{"icon": "Flower", "text": "not at all! i'd love the company.", "choice": false}
]

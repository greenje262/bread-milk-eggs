extends Node

onready var can_interact
onready var npc
onready var food_icon
onready var food_label
onready var food_path

onready var flower_interact = 0
onready var legs_interact = 0
onready var june_interact = 0
onready var doc_interact = 0

onready var grocery_list = []

onready var endgame = false

func reset():
	flower_interact = 0
	legs_interact = 0
	june_interact = 0
	doc_interact = 0
	grocery_list = []
	endgame = false

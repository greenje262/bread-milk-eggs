extends Sprite

var label = "Cat"

var dialogue = [
	{"icon": "Food", "text": str("take " + label + "?"), "choice": true}
]

func _ready():
	yield(get_tree().create_timer(randf() * 0.5), "timeout")
	$AnimationPlayer.play("bounce")

func _on_Area2D_body_entered(body: KinematicBody2D):
	if body == get_node("/root/GroceryStore/SortStack/Player"):
		GlobalVars.can_interact = true
		GlobalVars.npc = "Food"
		GlobalVars.food_icon = self.texture.resource_path
		GlobalVars.food_label = label
		GlobalVars.food_path = self
		$Indicator.show()

func _on_Area2D_body_exited(body: KinematicBody2D):
	if body == get_node("/root/GroceryStore/SortStack/Player"):
		GlobalVars.can_interact = false
		$Indicator.hide()

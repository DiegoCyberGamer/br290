extends Node
var Score : int
@onready var ScoreArea : Area2D = $Area2D
func get_destroyer():
	pass
func _on_area_2d_body_entered(body):
	if GameManager.Times_Up : return
	var chickens = ScoreArea.get_overlapping_bodies()
	for chicken in chickens:
		if chicken.is_in_group("Chicken"):
			var DeleteChicken : Player = chicken
			DeleteChicken.queue_free()
		GameManager.get_Respawner()
		GameManager.Add_Points()
	
	


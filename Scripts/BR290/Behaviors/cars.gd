
extends CharacterBody2D

@export var speed = 3.0
@onready var Restart : Area2D = $Area2D



func _physics_process(delta : float):	
	if GameManager.Times_Up : queue_free()
	if GameManager.Times_Up : return
	velocity.x = speed * 100 
	move_and_slide()

func _on_area_2d_body_entered(body):
	if GameManager.Times_Up : return
	
	var chickens = Restart.get_overlapping_bodies()
	for chicken in chickens:
		if chicken.is_in_group("Chicken"):
			var DeleteChicken : Player = chicken
			DeleteChicken.queue_free()
			GameManager.get_Respawner()
			GameManager.Deduct_Points()
			
			
	if body.name == "TileMap" :
		queue_free()


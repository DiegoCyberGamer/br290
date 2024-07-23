class_name Player
extends CharacterBody2D
var is_running: bool = false
@export var speed : float = 1
@onready var animation_player : AnimationPlayer = $AnimationPlayer

func player_input():
	var input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if GameManager.Times_Up : velocity = input_vector * 0
	if GameManager.Times_Up : return
	# Aplicando velocidade e movendo
	velocity = input_vector * speed * 100 
	if Input.is_action_just_pressed("running"):
		speed = 2
	if Input.is_action_just_released("running"):
		speed = 1
func Animation():
	if GameManager.Times_Up : animation_player.play("idle")
	if GameManager.Times_Up : return
#Setando animação das 8 direções baseado na velocity	
	if velocity.length() == 0:
		animation_player.play("idle")
	else:
		var direction = "_Down"
		if velocity.x > 0 && velocity.y > 0 : direction = "_DownRight"
		elif velocity.x < 0 && velocity.y == 0: direction = "_Left"
		elif velocity.x < 0 && velocity.y > 0: direction = "_DownLeft"
		elif velocity.x < -1 && velocity.y < -1  : direction = "_UpLeft"
		elif velocity.x > 0 && velocity.y == 0: direction = "_Right"
		elif velocity.x > 0  && velocity.y < 1  : direction = "_UpRight"
		elif velocity.y < 0: direction = "_Up"
		animation_player.play("Moving" + direction)
func _physics_process(delta: float) -> void:
	
	player_input()
	move_and_slide()
	Animation()

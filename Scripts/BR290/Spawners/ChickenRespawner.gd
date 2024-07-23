class_name Respawner
extends Node2D
var BlueChicken = preload("res://Assets/BR290/Scenes/player/player.tscn")
var Chicken = BlueChicken.instantiate()
func _ready():
	add_child(Chicken)
	
func RespawnChicken():
	var NewChicken = BlueChicken.instantiate()
	call_deferred("add_child", NewChicken)
	

extends Node2D

@export var cars_array: Array[PackedScene]
@export var cars_per_minute: float = 150.0
@onready var path_follow_2d: PathFollow2D = %PathFollow2D
var cooldown: float = 0.0


func _process(delta: float):
	if GameManager.Times_Up : return
	cooldown -= delta
	if cooldown > 0: return

	var interval = 60.0 / cars_per_minute
	cooldown = interval

	var index = randi_range(0, cars_array.size() - 1)
	var car_scene = cars_array[index]
	var car_spawn = car_scene.instantiate()
	car_spawn.global_position = get_point()
	get_parent().add_child(car_spawn)


func get_point() -> Vector2:
	path_follow_2d.progress_ratio = randf()
	return path_follow_2d.global_position
	


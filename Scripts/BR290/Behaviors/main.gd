extends Node

@export var ui : Node
@export var GameOver_Screen : PackedScene

func _ready():
	GameManager.Game_Over.connect(Game_Ended)
	
func _process(delta):
	GameManager.High_Score()
func Game_Ended():
	if ui:
		ui.queue_free()
		ui = null
	var Finalizer : GameOverUI = GameOver_Screen.instantiate()
	add_child(Finalizer)

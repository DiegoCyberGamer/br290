class_name GameOverUI
extends CanvasLayer
@export var ui : Node 
@export var GameOver_Screen : PackedScene
var Final_Score : int = GameManager.Score
var Waiting : float = 0.0
@onready var anim : AnimationPlayer = $AnimationPlayer

func _ready():
	GameManager.Game_Over.connect(Game_Over)
	%FinalPoints.text = str(Final_Score)
	%Number.text = str(GameManager.HighestScore)
	
func _process(delta):
	GameManager.High_Score()
	Reset_Game()
func Game_Over():
	if ui:
		ui.queue_free()
		ui = null
	var Finalizer = GameOver_Screen.instantiate()
	add_child(Finalizer)

func Reset_Game() :
	if not anim.is_playing():
		if Input.is_action_just_pressed("menuing"):
			GameManager.Reset()
			get_tree().reload_current_scene()

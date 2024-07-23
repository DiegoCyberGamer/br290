extends Node
var time_countdown : float = 60.0
@onready var Show_time : Label = %Time
func _ready():
	%Points.text = str(GameManager.Score)
func _process(delta):
	Show_Points()
	time_countdown -= delta
	var time_in_seconds : int = floori(time_countdown)
	var seconds : int = time_in_seconds % 60
	var minutes : int = time_in_seconds / 60
	Show_time.text = "%02d:%02d" % [minutes, seconds]
	if time_countdown < 0 :
		Show_time.text = "00:00"
		time_countdown = 0
		minutes = 0
		seconds = 0
		GameManager.Game_End()
		
func Show_Points():
	%Points.text = str(GameManager.Score)


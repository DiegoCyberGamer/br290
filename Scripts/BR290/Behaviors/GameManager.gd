
extends Node2D
signal Game_Over
var Score : int = 0
var HighestScore : int = 0
var Times_Up : bool = false

func Game_End(): 
	if Times_Up : return
	else:
		Times_Up = true
		Game_Over.emit()
func Reset():
	Times_Up = false
	Score = 0
	
	for connections in Game_Over.get_connections():
		Game_Over.disconnect(connections.callable)

func get_Respawner():
	var Respawn = get_tree().get_nodes_in_group("Respawner")
	for chicken in Respawn :
		var RespawnChicken : Respawner = chicken
		RespawnChicken.RespawnChicken()
	
	
func Add_Points():
	Score = Score + 1
	
func Deduct_Points():
	Score = Score - 1


func High_Score():
	if Score > HighestScore :
		HighestScore = Score
		

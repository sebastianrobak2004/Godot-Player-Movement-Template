extends Node



@onready var body = $"../../../.."
@onready var state_chart = $"../../../../StateChart"
@onready var player_data = $"../../../../PlayerData"

func _on_jumping_state_physics_processing(_delta):
	
	state_chart.send_event("to_rising")

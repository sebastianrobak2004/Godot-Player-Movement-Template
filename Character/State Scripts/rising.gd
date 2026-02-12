extends Node


@onready var body = $"../../../.."
@onready var state_chart = $"../../../../StateChart"


func _on_rising_state_physics_processing(_delta):
	if body.velocity.y <= 0:
		state_chart.send_event("to_falling")

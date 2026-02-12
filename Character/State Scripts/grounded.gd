extends Node

@onready var body = $"../../.."
@onready var state_chart = $"../../../StateChart"

func _on_grounded_state_physics_processing(_delta):
	if body.player_data.bhop_enabled:
		if Input.is_action_pressed("jump"):
			state_chart.send_event("to_jumping")
			body.velocity.y = body.player_data.jump_height
	else:
		if Input.is_action_just_pressed("jump"):
			state_chart.send_event("to_jumping")
			body.velocity.y = body.player_data.jump_height
	
	if not body.is_on_floor():
		state_chart.send_event("on_airborne")

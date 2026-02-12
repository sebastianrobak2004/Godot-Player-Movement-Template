extends Node

@onready var body = $"../../.."
@onready var state_chart = $"../../../StateChart"

func _on_airborne_state_physics_processing(delta):
	if body.is_on_floor():
		state_chart.send_event("on_grounded")
	
	if body.velocity.y > -85.0: 
		body.velocity.y -= body.player_data.gravity * delta

	
	var wish_dir = body.h.global_transform.basis * Vector3(body.input.dir.x, 0., body.input.dir.y)
	
	var cur_speed_in_wish_dir = body.velocity.dot(wish_dir)
	var capped_speed = min((body.player_data.air_move_speed * body.input.dir).length(), body.player_data.air_cap)
	var add_speed_till_cap = capped_speed - cur_speed_in_wish_dir
	if add_speed_till_cap > 0:
		var accel_speed = body.player_data.air_move_speed * delta
		accel_speed = min(accel_speed, add_speed_till_cap)
		body.velocity += accel_speed * wish_dir

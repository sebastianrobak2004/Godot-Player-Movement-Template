extends Node


@onready var body = $"../../../.."
@onready var state_chart = $"../../../../StateChart"
var player_data: Node

var current_mult: float
var current_accel_mult: float


func _ready():
	player_data = body.player_data
	current_mult = 1
	current_accel_mult = 1

func _on_moving_state_physics_processing(delta):
	if body.input.dir.length() + body.velocity.length() <= 0.001:
		state_chart.send_event("to_idle")
	
	_handle_ground_physics(delta)


func _handle_ground_physics(delta) -> void:
	var wish_dir = body.h.global_transform.basis * Vector3(body.input.dir.x, 0., body.input.dir.y)
	
	var speed = body.player_data.base_speed * current_mult
	
	var cur_speed_in_wish_dir = body.velocity.dot(wish_dir)
	var add_speed_till_cap = speed - cur_speed_in_wish_dir
	if add_speed_till_cap > 0:
		var accel_speed = body.player_data.ground_accel * delta * speed * current_accel_mult
		accel_speed = min(accel_speed, add_speed_till_cap)
		body.velocity += accel_speed * wish_dir
	
	var control = max(body.velocity.length(), body.player_data.ground_decel)
	var drop = control * body.player_data.ground_friction * delta
	var new_speed = max(body.velocity.length() - drop, 0.0)
	if body.velocity.length() > 0:
		new_speed /= body.velocity.length()
	body.velocity *= new_speed
	
	

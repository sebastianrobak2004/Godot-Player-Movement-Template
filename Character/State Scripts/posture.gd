extends Node

@onready var body = $"../.."
@onready var state_chart = $"../../StateChart"
@onready var moving = $"../Movement/Grounded/Moving"


func _on_standing_state_physics_processing(delta):
	if Input.is_action_pressed("crouch"):
		state_chart.send_event("to_crouching")
	body.camera.crouch_lerp(delta, false)
	body.crouching_collision.disabled = true
	body.standing_collision.disabled = false
	moving.current_accel_mult = 1

func _on_crouching_state_physics_processing(delta):
	if not Input.is_action_pressed("crouch") and not body.crouch_shape_cast.is_colliding():
		state_chart.send_event("to_standing")
	body.camera.crouch_lerp(delta, true)
	body.crouching_collision.disabled = false
	body.standing_collision.disabled = true
	moving.current_mult = body.player_data.crouching_modifier
	moving.current_accel_mult = body.player_data.crouch_accel_mult

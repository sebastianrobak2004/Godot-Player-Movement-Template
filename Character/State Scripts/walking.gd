extends Node

@onready var state_chart = $"../../../../../StateChart"


func _on_walking_state_physics_processing(delta):
	if Input.is_action_pressed("run") and not Input.is_action_pressed("crouch"):
		state_chart.send_event("to_running")
	
	get_parent().current_mult = 1
	get_parent().body.camera.fov_lerp_base(delta)

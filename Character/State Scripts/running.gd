extends Node

@onready var state_chart = $"../../../../../StateChart"


func _on_running_state_physics_processing(delta):
	if not Input.is_action_pressed("run"):
		state_chart.send_event("to_walking")
	
	get_parent().current_mult = get_parent().body.player_data.run_modifier
	get_parent().body.camera.fov_lerp_run(delta)

extends Node
@onready var body = $"../../../.."
@onready var state_chart = $"../../../../StateChart"


func _on_idle_state_physics_processing(_delta):
	var horisional_vel := Vector3(body.velocity.x, 0, body.velocity.z)
	if body.input.dir.length() > 0 or horisional_vel.length() > 0.01:
		state_chart.send_event("on_moving")
	

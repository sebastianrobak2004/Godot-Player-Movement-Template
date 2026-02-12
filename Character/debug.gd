extends Node

@onready var body = $"../.."
@onready var state_chart = $"../../StateChart"

func _process(_delta):
	if body:
		state_chart.set_expression_property("Player Valocity", body.velocity)
		state_chart.set_expression_property("Player Hitting Head", body.crouch_shape_cast.is_colliding())
		state_chart.set_expression_property("Looking At: ", body.interaction_ray_cast.current_object)
		state_chart.set_expression_property("Speed", body.velocity.length())
		state_chart.set_expression_property("fall", body.velocity.y)

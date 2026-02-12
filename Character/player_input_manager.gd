extends Node

@export var debug : bool = false
var mouse_delta := Vector2.ZERO

var dir :Vector2

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		mouse_delta += event.relative

func _physics_process(_delta):
	mouse_delta = Vector2.ZERO
	
	dir = Input.get_vector("left", "right", "up", "down")
	

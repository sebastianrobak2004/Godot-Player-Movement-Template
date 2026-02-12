extends Node3D

@onready var camera_anchor = $"../H/V/CameraAnchor"
var update = false
var gt_prev : Transform3D
var gt_current: Transform3D

func _ready():
	global_transform = camera_anchor.global_transform
	
	gt_prev = camera_anchor.global_transform
	gt_current = camera_anchor.global_transform
	
func update_transform():
	gt_prev = gt_current
	gt_current = camera_anchor.global_transform

func _process(_delta):
	if update:
		update_transform()
		update = false
	
	var f = clamp(Engine.get_physics_interpolation_fraction(), 0, 1)
	global_transform = gt_prev.interpolate_with(gt_current, f)

func _physics_process(_delta):
	update = true

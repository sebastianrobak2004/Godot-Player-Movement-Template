extends Marker3D

@export var crosshair_sync_dist: float = -100
@onready var start = $"../BulletStartLocation"
@onready var aim_point_ray = $"../AimPointRay"
@onready var camera_3d = $".."

#raycast and set pos to the raycast

func _physics_process(_delta):
	if aim_point_ray.is_colliding():
		global_position = aim_point_ray.get_collision_point()
	else:
		position = Vector3(0,0,-100)

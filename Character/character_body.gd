extends CharacterBody3D

@onready var player_data = $PlayerData
@onready var input = $Input 

@onready var head = $Head
@onready var h = $Head/H
@onready var v = $Head/H/V
@onready var camera_anchor = $Head/H/V/CameraAnchor

@onready var smooth_camera = $Head/SmoothCamera
@onready var camera = $Head/SmoothCamera/Camera3D
@onready var interaction_ray_cast = $Head/SmoothCamera/Camera3D/InteractionRayCast

@onready var crouching_collision = $CrouchingCollision
@onready var standing_collision = $StandingCollision
@onready var crouch_shape_cast = $CrouchShapeCast


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func camera_rotation():
	h.rotate_y(-input.mouse_delta.x * player_data.sensitivity)
	v.rotate_x(-input.mouse_delta.y * player_data.sensitivity)
	smooth_camera.global_transform = camera_anchor.get_global_transform_interpolated()


func _physics_process(_delta):
	camera_rotation()
	move_and_slide()

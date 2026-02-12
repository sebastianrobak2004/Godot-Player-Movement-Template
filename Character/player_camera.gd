extends Camera3D
class_name PlayerCamera

@export_group("Cam Sprint FOV")
@export var base_fov: float = 75.0
@export var run_fov: float = 90.0
@export var fov_lerp_speed: float = 8.0
@export_group("Crouch Camera Y")
@export var base_y: float = 0.5
@export var crouch_y_modifier: float = -0.6
@export var crouch_lerp_speed: float = 20.0


#region FOV
func lerp_fov_to(target_fov: float, delta: float) -> void:
	fov = lerp(fov, target_fov, delta * fov_lerp_speed)


func fov_lerp_run(delta: float) -> void:
	var target: float = run_fov
	lerp_fov_to(target,delta)


func fov_lerp_base(delta: float) -> void:
	var target: float = base_fov
	lerp_fov_to(target,delta)
#endregion


#region Position
func crouch_lerp(delta: float, isCrouching: bool):
	var mod: float = base_y
	if isCrouching:
		mod = crouch_y_modifier
	var target_y = base_y + mod
	position.y = lerp(position.y, target_y, delta * crouch_lerp_speed)
#endregion

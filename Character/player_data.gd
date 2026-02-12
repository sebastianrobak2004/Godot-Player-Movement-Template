extends Node

@export_category("Mouse Movement")
@export var sensitivity: float = 0.003

@export_category("Movement")
@export var base_speed: float = 7.0
@export var crouching_modifier = 0.74
@export var run_modifier: float = 1.4
@export var ground_accel := 11.0
@export var crouch_accel_mult := 13.0
@export var ground_decel := 10.0
@export var ground_friction := 5

@export var air_move_speed := 500.0
@export var air_cap := 0.85
@export var air_accell := 800.0
@export var gravity := 12
@export var jump_height := 5
@export var bhop_enabled := true


@export_category("Sound Effects")
@export var jump_sound_effect: AudioStream
@export var shoot_sound_effect: AudioStream

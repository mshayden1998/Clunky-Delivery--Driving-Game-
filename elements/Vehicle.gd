extends RigidBody2D

onready var b_wheel = $BackWheel
onready var jump_error_detectors = [
	$BWJumpError,
	$FWJumpError
]
var engine_force = 1500.0
var max_speed = 5000.0
var jump_force = -5000
var rotation_force = 800.0


func _ready():
	pass


func _physics_process(delta):
	get_input(delta)


func get_input(delta):
	# Forward and backward movements
	if Input.is_action_pressed("player_up"):
		b_wheel.apply_torque_impulse(engine_force * delta * 60)
	if Input.is_action_pressed("player_down"):
		b_wheel.apply_torque_impulse(-engine_force * delta * 60)
	# Chassis rotation mechanic
	if Input.is_action_pressed("player_left"):
		apply_torque_impulse(-rotation_force * delta * 60)
	if Input.is_action_pressed("player_right"):
		apply_torque_impulse(rotation_force * delta * 60)
	# Jump mechanic
	for i in jump_error_detectors.size():
		if jump_error_detectors[i].is_colliding():
			if Input.is_action_just_pressed("player_jump"):
				apply_central_impulse(Vector2(0, jump_force))

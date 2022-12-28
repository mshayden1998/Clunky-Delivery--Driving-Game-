extends RigidBody2D

onready var b_wheel := $BackWheel
var engine_force := 1500.0
var max_speed := 5000.0
var rotation_force := 900.0
const fps := 60


func _ready():
	pass


func _physics_process(delta):
	get_input(delta)


func get_input(delta):
	# Forward and backward movements
	if Input.is_action_pressed("player_up"):
		b_wheel.apply_torque_impulse(engine_force * delta * fps)
	if Input.is_action_pressed("player_down"):
		b_wheel.apply_torque_impulse(-engine_force * delta * fps)
	# Chassis rotation mechanic
	if Input.is_action_pressed("player_left"):
		apply_torque_impulse(-rotation_force * delta * fps)
	if Input.is_action_pressed("player_right"):
		apply_torque_impulse(rotation_force * delta * fps)

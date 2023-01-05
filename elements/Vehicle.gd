extends RigidBody2D

onready var b_wheel := $BackWheel
var engine_force := 1500.0
var max_speed := 5000.0
var rotation_force := 900.0
var fuel := 100
const fps := 60
export var decrease_amout := 0.5

signal fuel_updated(fuel)


func _ready():
	emit_signal("fuel_updated", fuel)


func _physics_process(delta):
	player_control(delta)


func player_control(delta):
	# Forward and backward movements
	if fuel > 0:
		if Input.is_action_pressed("player_up"):
			b_wheel.apply_torque_impulse(engine_force * delta * fps)
		if Input.is_action_pressed("player_down"):
			b_wheel.apply_torque_impulse(-engine_force * delta * fps)
	# Chassis rotation mechanic
	if Input.is_action_pressed("player_left"):
		apply_torque_impulse(-rotation_force * delta * fps)
	if Input.is_action_pressed("player_right"):
		apply_torque_impulse(rotation_force * delta * fps)


func update_fuel(amount):
	fuel -= amount
	emit_signal("fuel_updated", fuel)


func _on_FuelTimer_timeout():
	update_fuel(decrease_amout)

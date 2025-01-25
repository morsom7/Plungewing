extends RigidBody2D

enum {BOTTLE_MODE, DUCK_MODE}
var control_mode = BOTTLE_MODE

# Upgradables
@export var cannon_power: float = 1.0 					# Substitute for cannon
@export var flap_power: float = 1						# Strength of the flap
@export var flaps_available: int = 1					# Flapping increases height and allows for more glide
@export var swimming_rings_available: int = 0			# Gives a bounce if hits the water
var is_attached_to_cannon: bool = true						# Checks if duck is launched
@onready var bottle_duck_anchor: Node2D = $"../FatMan/Launcher/AnimatedSprite2D/Bottle_DuckAnchor"
@onready var launcher: RigidBody2D = $"../FatMan/Launcher"


var is_at_rest: bool = false

func _ready() -> void:	
	SignalBus.duck_flaps.connect(flap)	# When signal "duck_flaps" is triggered, it calls the function "flap()"
	SignalBus.duck_bubble_bounced.connect(bounce)
	SignalBus.bottle_popped.connect(launch)
	global_position = bottle_duck_anchor.global_position
	#test FMOD

func _physics_process(delta: float) -> void:		
	if control_mode == BOTTLE_MODE:
		global_position = bottle_duck_anchor.global_position
		global_rotation = launcher.rotation
		
		if Input.is_action_just_pressed("launch"):
			SignalBus.bottle_popped.emit()
	if control_mode == DUCK_MODE:
		if Input.is_action_just_pressed("flap_and_glide"):	# Flapping to increase height
			SignalBus.duck_flaps.emit() 
		pass
	
	# Checking if movements stops
		var velocity = get_linear_velocity()
		if velocity == Vector2(0,0) and global_position.x>225:
			print("Stopped moving!")
			SignalBus.duck_stops_moving.emit()

func launch():
	control_mode = DUCK_MODE
	gravity_scale = 1
	apply_impulse(Vector2(2000,2000))
	apply_torque_impulse(500)
	pass

func flap() -> void:
	# check if flaps available
	var force = 4000 # standard force for level 1 flap power
	apply_impulse(Vector2(0,-force * flap_power))
	# play animation
	# play sound	
	# reduce number of flaps available
	pass

func glide() -> void:
	# add slight upwards force to counteract gravity
	# play animation
	# play sound	
	pass

func bounce(bounce_power: float) -> void:
	apply_impulse(Vector2(0,-bounce_power))

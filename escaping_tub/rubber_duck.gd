extends RigidBody2D

enum {BOTTLE_MODE, DUCK_MODE}
var control_mode = BOTTLE_MODE

# Upgradables
@export var cannon_power: float = 1.0 					# Substitute for cannon
@export var flap_power: float = 0.1						# Strength of the flap
@export var flaps_available: int = 1					# Flapping increases height and allows for more glide
@export var swimming_rings_available: int = 0			# Gives a bounce if hits the water
@export var glide_power: float = 1.0						# The amount glide affects trajectory
@export var is_gliding: bool = false					# checks if duck is gliding
var is_attached_to_cannon: bool = true						# Checks if duck is launched
@onready var bottle_duck_anchor: Node2D = $"../FatMan/Launcher/AnimatedSprite2D/Bottle_DuckAnchor"
@onready var launcher: RigidBody2D = $"../FatMan/Launcher"

var is_at_rest: bool = false

func _ready() -> void:	
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
			flap()
			pass
		if is_gliding:
			if Input.is_action_pressed("duck_glide_up"):
				glide_up()
			if Input.is_action_pressed("duck_glide_down"):
				glide_down()
		
		pass
	
	# Checking if movements stops
		var velocity = get_linear_velocity()
		if velocity == Vector2(0,0) and global_position.x>225:
			print("Stopped moving!")
			SignalBus.duck_stops_moving.emit()

func launch():
	control_mode = DUCK_MODE
	gravity_scale = 1
	apply_impulse(Vector2(1000 * cannon_power,-1000 * cannon_power))
	apply_torque_impulse(500)
	pass

func flap() -> void:
	if flaps_available > 0:
		SignalBus.duck_flaps.emit() 
		is_gliding = true
		apply_impulse(Vector2(0,linear_velocity.y * flap_power))
		
	# play animation
	# play sound	
	# reduce number of flaps available
	pass

func glide_up() -> void:
	apply_impulse(Vector2(0,-glide_power * 100))
	global_rotation_degrees = -15
	# add slight upwards force to counteract gravity
	# play animation
	# play sound	
	pass
	
func glide_down() -> void:
	apply_impulse(Vector2(0,glide_power * 100))
	global_rotation_degrees = 15
	# add slight upwards force to counteract gravity
	# play animation
	# play sound	
	pass
	
func bounce(bounce_power: float) -> void:
	apply_impulse(Vector2(0,-bounce_power))
	
func is_hit() -> void:
	is_gliding = false
	add_constant_torque(500)
	
func duck_splash()

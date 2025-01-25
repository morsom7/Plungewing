extends RigidBody2D

signal stops_moving

# Upgradables
var flap_power: float = 1					# Strength of the flap
var flaps_available: int = 1					# Flapping increases height and allows for more glide
var swimming_rings_available: int = 0			# Gives a bounce if hits the water

func _physics_process(delta: float) -> void:		
	if Input.is_action_just_pressed("flap_and_glide"):	# Flapping to increase height
		flap()		
	if Input.is_action_just_released("flap_and_glide"):	# Keeping space to glide, stop gliding when released
		# stop gliding
		pass
	
	# Checking if movements stops
	var velocity = get_linear_velocity()
	if velocity == Vector2(0,0):
		stops_moving.emit()
		print("Stopped moving!")

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

func bounce(bubble_power: float) -> void:
	apply_impulse(Vector2(0,-bubble_power))

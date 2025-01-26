extends RigidBody2D

enum {BOTTLE_MODE, DUCK_MODE}
var control_mode = BOTTLE_MODE

# Upgradables
@export var cannon_power: float = 1.0 					# Substitute for cannon
@export var flap_power: float = 0.1						# Strength of the flap
@export var flaps_available: int = 5					# Flapping increases height and allows for more glide
@export var swimming_rings_available: int = 0			# Gives a bounce if hits the water
@export var glide_power: float = 1.0						# The amount glide affects trajectory
@export var is_gliding: bool = false					# checks if duck is gliding

var is_attached_to_cannon: bool = true						# Checks if duck is launched
@onready var bottle_duck_anchor: Node2D = $"../FatMan/Launcher/AnimBottleCola/Bottle_DuckAnchor"
@onready var launcher: RigidBody2D = $"../FatMan/Launcher"
@onready var anim_duck: AnimatedSprite2D = $AnimDuck
@onready var anim_bottle_fizz: AnimatedSprite2D = $AnimBottleFizz


var is_at_rest: bool = false

func _ready() -> void:	
	SignalBus.duck_bubble_bounced.connect(bounce)
	SignalBus.bottle_popped.connect(launch)
	SignalBus.duck_hit_water.connect(duck_water_check)
	SignalBus.duck_bubble_bounced.connect(bounce)
	
	self.global_position = bottle_duck_anchor.global_position
	upgrade_stats_from_GameManager()

func _physics_process(delta: float) -> void:		
	if control_mode == BOTTLE_MODE:
		global_position = bottle_duck_anchor.global_position
		global_rotation = launcher.rotation
		
		if Input.is_action_just_released("launch"):
			SignalBus.bottle_popped.emit()
	if control_mode == DUCK_MODE:
		if Input.is_action_just_pressed("flap_and_glide"):	# Flapping to increase height
			flap()
			pass
		if is_gliding:
			angular_velocity = 0
			anim_duck.play("duck_anim_glide")
			anim_duck.speed_scale = 1
			if Input.is_action_pressed("duck_glide_up"):
				glide_up()
			if Input.is_action_pressed("duck_glide_down"):
				glide_down()

func upgrade_stats_from_GameManager():
	cannon_power = 1 + GameManager.BOTTLE_LEVEL 					# Substitute for cannon
	flap_power = 1 + GameManager.FLAP_POWER						# Strength of the flap
	flaps_available = GameManager.FLAP_AMOUNT					# Flapping increases height and allows for more glide
	swimming_rings_available = GameManager.SWIMMING_RINGS			# Gives a bounce if hits the water


func launch():
	control_mode = DUCK_MODE
	gravity_scale = 1
	apply_impulse(Vector2(1000 * cannon_power,-1000 * cannon_power))
	apply_torque_impulse(1000)
	is_hit()
	
	pass

func flap() -> void:
	if flaps_available > 0:
		flaps_available -= 1
		print("flap")
		SignalBus.duck_flaps.emit() 
		is_gliding = true
		anim_duck.play("duck_anim_glide")
		anim_duck.speed_scale = 1
		apply_impulse(Vector2(0,linear_velocity.y * flap_power * get_process_delta_time()))
		linear_velocity.y = clamp(linear_velocity.y,0,linear_velocity.y)
		apply_impulse(Vector2(0, -1000 * flap_power))


func glide_up() -> void:
	angular_velocity = 0
	global_rotation_degrees = -15
	anim_duck.speed_scale = 2
	apply_impulse(Vector2(0,-glide_power * 600 * get_physics_process_delta_time()))
	print("Glide up "+str(Vector2(0, -glide_power * 600 * get_physics_process_delta_time())))
	# add slight upwards force to counteract gravity
	
	# play animation
	# play sound	
	pass
	
func glide_down() -> void:
	angular_velocity = 0
	global_rotation_degrees = 15
	anim_duck.speed_scale = 0.1
	apply_impulse(Vector2(0, glide_power * 500 * get_physics_process_delta_time()))
	print("Glide down "+str(Vector2(0, glide_power * 500 * get_physics_process_delta_time())))
	# add slight upwards force to counteract gravity
	# play animation
	# play sound	
	pass
	
func bounce(bubble_type: String) -> void:
	self.linear_velocity.y = 0
	var bubble_power = 1
	match bubble_type:
		"super": bubble_power = 1.5
		"slow": bubble_power = 0.75
	bubble_power = bubble_power * 250
	#apply_impulse(Vector2(bubble_power * get_physics_process_delta_time(),bubble_power * get_physics_process_delta_time()))
	apply_impulse(Vector2(0.3 * bubble_power,-2 * bubble_power))
	# play animation
	#print("Bounced on bubble")
	
func is_hit() -> void:
	is_gliding = false
	anim_duck.play("duck_anim_hit")
	add_constant_torque(500)

func duck_water_check() -> void:
	print("Duck_hit_water")
	if swimming_rings_available > 0:
		apply_impulse(Vector2(0, 2 * -linear_velocity.y))
		swimming_rings_available -= 1
		return
	SignalBus.duck_splash.emit()
	linear_velocity = Vector2(0,0)
	gravity_scale = 0
	anim_duck.play("duck_anim_idle")
	set_physics_process(false)
	
	pass # Replace with function body.

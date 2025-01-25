extends Node

enum {BOTTLE_MODE, DUCK_MODE}
var control_mode = BOTTLE_MODE
@onready var Launcher = $Launcher
@export var shake_force: int = 150
@onready var fat_man_arm_pivot: Node2D = $FatMan_arm_pivot


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if control_mode == BOTTLE_MODE:
		if Input.is_action_just_pressed("man_arm_up"):
			print("arm up")
		if Input.is_action_just_pressed("man_arm_down"):
			print("arm down")
		pass
		
	pass

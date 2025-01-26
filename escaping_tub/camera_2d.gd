extends Camera2D
@onready var rubber_duck: RigidBody2D = $"../RubberDuck"

@onready var rubber_duck: RigidBody2D = $"../RubberDuck"
@export var camera_offset_x: float = 0.0
@export var camera_offset_y: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.global_position = Vector2(rubber_duck.global_position.x + camera_offset_x,rubber_duck.global_position.y + camera_offset_y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position = Vector2(rubber_duck.global_position.x + camera_offset_x,rubber_duck.global_position.y + camera_offset_y)
	pass
